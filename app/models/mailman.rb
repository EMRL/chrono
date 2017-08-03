# Receive and handle emails sent to tasks
require "#{RAILS_ROOT}/vendor/email_reply_parser/lib/email_reply_parser"

class Mailman < ActionMailer::Base

  def get_body(email)
      body = nil

      if email.multipart? then
        email.parts.each do |m|
          puts m.content_type
          if m.content_type.downcase == "text/plain"
            body = m.body
          elsif m.multipart?
            body = get_body(m)
          end
        end
      end

      body ||= email.body
  end

  # copied from app/controllers/application.rb
  def parse_time(user, input, minutes = false)
    total = 0
    unless input.nil?
      miss = false
      reg = Regexp.new("(#{_('[wdhm]')})")
      input.downcase.gsub(reg,'\1 ').split(' ').each do |e|
        part = /(\d+)(\w+)/.match(e)
        if part && part.size == 3
          case  part[2]
          when _('w') then total += e.to_i * user.workday_duration * user.days_per_week
          when _('d') then total += e.to_i * user.workday_duration
          when _('h') then total += e.to_i * 60
          when _('m') then total += e.to_i
          else
            miss = true
          end
        end
      end

      # Fallback to default english parsing
      if miss
        eng_total = 0
        reg = Regexp.new("([wdhm])")
        input.downcase.gsub(reg,'\1 ').split(' ').each do |e|
          part = /(\d+)(\w+)/.match(e)
          if part && part.size == 3
            case  part[2]
            when 'w' then eng_total += e.to_i * user.workday_duration * user.days_per_week
            when 'd' then eng_total += e.to_i * user.workday_duration
            when 'h' then eng_total += e.to_i * 60
            when 'm' then eng_total += e.to_i
            end
          end
        end

        if eng_total > total
          total = eng_total
        end

      end

      if total == 0
        times = input.split(':')
        while time = times.shift
          case times.size
          when 0 then total += time.to_i
          when 1 then total += time.to_i * 60
          when 2 then total += time.to_i * user.workday_duration
          when 3 then total += time.to_i * user.workday_duration * user.days_per_week
          end
        end
      end

      if total == 0 && input.to_i > 0
        total = input.to_i
      end

      total = total * 60 unless minutes

    end
    total
  end

  def receive(email)
    e = Email.new
    e.to = email.to.join(", ")
    e.from = email.from.join(", ")

    e.body = get_body(email)
    e.body = EmailReplyParser.parse_reply(e.body, e.from)

    e.subject = email.subject

    # duration
    #duration = 0

    #if e.subject !~ /^Re:\s*\[EMRL\]/
      #duration = parse_time(e.subject)
    #end

    company = nil
    email.to.each do |to|
      next unless to.include?($CONFIG[:domain])
      subdomain = to.split('@')[1].split('.')[0]
      #Rails.logger "Looking for #{subdomain}.."
      company ||= Company.find_by_subdomain(subdomain)
    end

    if company
      e.company = company
      e.user = User.find_by_email(e.from, :conditions => ["company_id = ?", company.id])
    end

    e.save

#    return if(e.from.downcase.include? $CONFIG[:domain] || company.nil?)

    target = nil
    email.to.each do |to|
      if to.include?("task-")
#        Rails.logger "looking for a task"
        _, task_num = /task-(\d+).*@.*/.match(to).to_a
        if task_num.to_i > 0
#          Rails.logger "Looking for task[#{task_num}] from [#{company.name}]"
          target = Task.find(:first, :conditions => ["company_id = ? AND task_num = ?", company.id, task_num])
        end
      end
    end

    puts "target[#{target}]"

    if target && target.is_a?(Task)
      puts "Found target [#{target.name}]"
      notify_targets = target.project.users.collect{ |u| u.email.downcase }.flatten.uniq
      notify_targets += Task.find(:all, :conditions => ["project_id = ? AND notify_emails IS NOT NULL and notify_emails <> ''", target.project_id]).collect{ |t| t.notify_emails.split(',').collect{ |i| i.strip.downcase } }.flatten.uniq

#      Rails.logger "Possible participants[#{notify_targets.join(', ')}]"

      if notify_targets.include?(email.from.first.downcase)
        if email.has_attachments?
          email.attachments.each do |attachment|

#            Rails.logger "Attachement[#{attachment.original_filename}]"

            task_file = ProjectFile.new()
            task_file.company = e.user.company
            task_file.customer = target.project.customer
            task_file.project = target.project
            task_file.task = target
            task_file.user = e.user
            task_file.filename = attachment.original_filename
            task_file.name = attachment.original_filename
            task_file.file_size = 0
            task_file.save

            task_file.reload

            if !File.directory?(task_file.path)
              File.umask(0)
              Dir.mkdir(task_file.path, 0777) rescue nil
            end

            File.umask(0)
            File.open(task_file.file_path, "wb", 0777) { |f| f.write( attachment.read ) } rescue begin
 #                                                                                         Rails.logger "Unable to save attachment.."
                                                                                          task_file.destroy
                                                                                          task_file = nil
                                                                                        end
            if task_file
              task_file.file_size = File.size(task_file.file_path)
  #            Rails.logger "Attachment saved[#{task_file.file_path}][#{task_file.file_size}]"
              task_file.save
            end

          end
        end

        w = WorkLog.new
        user = nil
        if e.user.nil?
          user = User.new
          user.id = 10000000
          user.email = email.from.first
          user.name = email.from.first
          user.receive_notifications = 1
          w.body = e.body + "\n[" + user.email + "]"
        else
          user = e.user
          w.body = e.body
        end


        w.user = user
        w.company = target.project.company
        w.customer = target.project.customer
        w.project = target.project
        w.task = target
        w.started_at = Time.now.utc
        w.duration = parse_time(user, e.subject)
        w.log_type = EventLog::TASK_COMMENT

        w.save

        w.event_log.user = e.user
        w.event_log.save

        # user = nil
        # if e.user.nil?
        #   user = User.new
        #   user.name = email.from.first
        #   user.email = email.from.first
        #   user.receive_notifications = 1
        # else
        #   user = e.user
        # end

        Notifications::deliver_changed( :comment, target, user, e.body.gsub(/<[^>]*>/,'')) rescue begin
#                                                                                                    Rails.logger "Error sending notificaiton email"
                                                                                                  end
      else
        # Unknown email
        Notifications::deliver_unknown_from_address(email.from.first, company.subdomain) rescue nil
      end
    end

#      if email.has_attachments?
#        for attachment in email.attachments
#          page.attachments.create({
#            :file => attachment,
#            :description => email.subject
#          })
#        end
#      end
    end
  end
