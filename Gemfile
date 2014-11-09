source "https://rubygems.org"

gem "rails", "4.1.7"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "devise", "3.2.4"
gem "omniauth-facebook"
gem "kaminari"
gem "ransack"
gem "dynamic_form"
gem "tzinfo-data"
gem "cocoon"
gem "sass"
gem "ckeditor_rails"


group :test, :development do
  gem "rspec-rails"
  gem "awesome_print"
end

group :development do
  gem "chronic"
  gem "admin_view"
end

group :test do
  gem "factory_girl_rails"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "capybara"
  gem "shoulda"
  gem "email_spec"
end

platforms :jruby do
  # jruby-openssl is bundled with JRuby 1.7.0
  gem "jruby-openssl" if Object.const_defined?(:JRUBY_VERSION) && JRUBY_VERSION < '1.7.0'
end

require 'erb'
require 'yaml'
database_file = File.join(File.dirname(__FILE__), "config/database.yml")
if File.exist?(database_file)
  database_config = YAML::load(ERB.new(IO.read(database_file)).result)
  adapters = database_config.values.map {|c| c['adapter']}.compact.uniq
  if adapters.any?
    adapters.each do |adapter|
      case adapter
      when 'mysql2'
        gem "mysql2", "~> 0.3.16", :platforms => [:mri, :mingw]
        gem "activerecord-jdbcmysql-adapter", :platforms => :jruby
      when /postgresql/
        gem "pg", ">= 0.11.0", :platforms => [:mri, :mingw]
        gem "activerecord-jdbcpostgresql-adapter", :platforms => :jruby
      when /sqlite3/
        gem "sqlite3", :platforms => [:mri, :mingw]
        gem "activerecord-jdbcsqlite3-adapter", :platforms => :jruby
      else
        warn("Unknown database adapter `#{adapter}` found in config/database.yml, use Gemfile.local to load your own database gems")
      end
    end
  else
    warn("No adapter found in config/database.yml, please configure it first")
  end
else
  warn("Please configure your config/database.yml first")
end

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  puts "Loading Gemfile.local ..." if $DEBUG # `ruby -d` or `bundle -v`
  instance_eval File.read(local_gemfile)
end