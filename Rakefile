# encoding: UTF-8
require 'rubygems'
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rake'
require 'rake/rdoctask'
require 'rake/testtask'

# jeweler
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "new_data_notifier"
  gem.homepage = "http://github.com/hlxwell/new_data_notifier"
  gem.license = "MIT"
  gem.summary = %Q{If there is some new users signed up on your site or some new articles been added by some other user, If you hope been notified, please execute "gem install new_data_notifier}
  gem.description = %Q{If there is some new users signed up on your site or some new articles been added by some other user, If you hope been notified, please execute "gem install new_data_notifier}
  gem.email = "hlxwell@gmail.com"
  gem.authors = ["michael he"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

# Rcov
require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

# Reek tasks
require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = true
  t.verbose = false
  t.source_files = 'lib/**/*.rb'
end

# test tasks
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end
task :default => :test