Twilio.configure do |config|
  config.account_sid = ENV['TWILIO_ACCOUNT_SID']
  config.auth_token = ENV['TWILIO_AUTH_TOKEN']
end

#Because of this code,  we never have to pass in the SID and AUTH_TOKEN throughout the project when we use Twilio::REST::Client.new
