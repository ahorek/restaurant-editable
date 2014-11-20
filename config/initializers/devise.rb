Devise.setup do |config|
  config.mailer_sender = "stylova-restaurace.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.stretches = 10
  config.reset_password_within = 6.hours
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  config.secret_key = 'bc80861a6df47a67eee464a0c5f4f579f9d11415cf15b7e1ab82171a1ddc016ff4096de7b24eee6f'
end
