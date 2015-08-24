# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rails"
  s.version = "1.2.6"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.cert_chain = nil
  s.date = "2007-11-23"
  s.description = "Rails is a framework for building web-application using CGI, FCGI, mod_ruby, or WEBrick on top of either MySQL, PostgreSQL, SQLite, DB2, SQL Server, or Oracle with eRuby- or Builder-based templates."
  s.email = "david@loudthinking.com"
  s.executables = ["rails"]
  s.files = ["bin/rails"]
  s.homepage = "http://www.rubyonrails.org"
  s.rdoc_options = ["--exclude", "."]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = "rails"
  s.rubygems_version = "1.8.24"
  s.summary = "Web-application framework with template engine, control-flow layer, and ORM."

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.7.2"])
      s.add_runtime_dependency(%q<activesupport>, ["= 1.4.4"])
      s.add_runtime_dependency(%q<activerecord>, ["= 1.15.6"])
      s.add_runtime_dependency(%q<actionpack>, ["= 1.13.6"])
      s.add_runtime_dependency(%q<actionmailer>, ["= 1.3.6"])
      s.add_runtime_dependency(%q<actionwebservice>, ["= 1.2.6"])
    else
      s.add_dependency(%q<rake>, [">= 0.7.2"])
      s.add_dependency(%q<activesupport>, ["= 1.4.4"])
      s.add_dependency(%q<activerecord>, ["= 1.15.6"])
      s.add_dependency(%q<actionpack>, ["= 1.13.6"])
      s.add_dependency(%q<actionmailer>, ["= 1.3.6"])
      s.add_dependency(%q<actionwebservice>, ["= 1.2.6"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.7.2"])
    s.add_dependency(%q<activesupport>, ["= 1.4.4"])
    s.add_dependency(%q<activerecord>, ["= 1.15.6"])
    s.add_dependency(%q<actionpack>, ["= 1.13.6"])
    s.add_dependency(%q<actionmailer>, ["= 1.3.6"])
    s.add_dependency(%q<actionwebservice>, ["= 1.2.6"])
  end
end
