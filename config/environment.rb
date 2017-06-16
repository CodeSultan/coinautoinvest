# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Encoding::default_internal = Encoding::UTF_8
Encoding::default_external = Encoding::UTF_8
#
# Rails.application.configure do
#
#   config.action_mailer.delivery_method = :smtp
#
#   config.action_mailer.smtp_settings = {
#
#       address:              'smtp-mail.outlook.com',
#       port:                 2525,
#       # domain:               'dominik-first.herokuapp.com',
#       domain:               '127.0.0.1:4000',
#       user_name:            'gamberg1001@outlook.com',
#       password:             'while(true);',
#       authentication:       'plain',
#       enable_starttls_auto: true,
#       openssl_verify_mode:  'none'
#   }
#
#   # Don't care if the mailer can't send.
#   config.action_mailer.raise_delivery_errors = true
#
#   config.action_mailer.perform_deliveries = true
#
#   config.action_mailer.perform_caching = false
#
# end
#
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#     address: 'smtp-mail.outlook.com',
#     port: 2525,
#     # domain: 'dominik-first.herokuapp.com',
#     domain:               'localhost:3000',
#     authentication: 'plain',
#     enable_starttls_auto: true,
#     user_name: 'gamberg1001@outlook.com',
#     password: 'while(true);'
# }
# # ActionMailer::Base.default_url_options[:host] = "dominik-first.herokuapp.com"
# ActionMailer::Base.default_url_options[:host] = "127.0.0.1:4000"