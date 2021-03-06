# ActionMailer::Base.add_delivery_method :ses,
#                                       AWS::SES::Base,
#                                       access_key_id: ENV['AWS_ACCESS_KEY_ID'],
#                                       secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#                                       server: 'email.us-east-1.amazonaws.com'

Aws::Rails.add_action_mailer_delivery_method(
  :ses,
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: 'us-east-1' #AWS SESで設定したregion
)