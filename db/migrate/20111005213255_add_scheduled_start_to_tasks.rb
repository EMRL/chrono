class AddScheduledStartToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :scheduled_start, :datetime
  end

  def self.down
    remove_column :tasks, :scheduled_start
  end
end
