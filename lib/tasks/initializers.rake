desc 'Generates a secret token for the application.'
file 'config/initializers/secret_token.rb' do
  path = File.join(Rails.root, 'config', 'initializers', 'secret_token.rb')
  secret = SecureRandom.hex(40)
  File.open(path, 'w') do |f|
    f.write <<"EOF"
# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
BaseApp::Application.config.secret_token = '#{secret}'
EOF
  end
end

desc 'Generates a secret token for the application.'
task :generate_secret_token => ['config/initializers/secret_token.rb']

desc 'Generates an initializer for devise.'
file 'config/initializers/devise.rb' do
  path = File.join(Rails.root, 'config', 'initializers', 'devise.rb')
  secret = SecureRandom.hex(40)
  File.open(path, 'w') do |f|
    f.write <<"EOF"
Devise.setup do |config|
  config.mailer_sender = "stylova-restaurace.com"
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.stretches = 10
  config.email_regexp = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  config.reset_password_within = 6.hours
  config.omniauth :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  config.secret_key = '#{secret}'
end
EOF
  end
end

desc 'Generates an initializer for devise.'
task :generate_devise_initializer => ['config/initializers/devise.rb']




