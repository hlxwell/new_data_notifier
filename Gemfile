source "http://rubygems.org"

gem "rails", ">= 3.0.0"

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

group :development do
  gem "sqlite3-ruby", :require => "sqlite3"
  gem "bundler"
  gem "jeweler"
  gem "rcov"
  gem "reek"
end

group :test do
  gem "timecop"
  gem "factory_girl", :require => "factory_girl", :git => "git://github.com/thoughtbot/factory_girl.git"
  gem "shoulda", :require => "shoulda"
  gem "test_benchmarker"
  gem "rack-test", :require => "rack/test"
end