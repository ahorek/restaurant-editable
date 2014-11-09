Devise.setup do |config|
  config.mailer_sender = "mail@domain.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.stretches = 10
  config.password_length = 6..20
  config.email_regexp = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  config.reset_password_within = 6.hours
  config.secret_key = ENV["DEVISE_SECRET_KEY"] || '696acf756fc36cde5c1654ade4ff0449fc095863a4bdccbc6cb55f5321d7268337128e5deee3771d5bee26a21f31bd160b2e91dfdec9dcd4d354b5e9404b6455'
end
