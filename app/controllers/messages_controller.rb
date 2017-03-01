class MessagesController < ApplicationController
  include ApiHelper
  skip_before_filter :verify_authenticity_token
  def reply
    new_response = YelpResponse.new(params["Body"])
    from_number = params["From"]
    response = new_response.process_response
    boot_twilio
    sms = @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: from_number,
      body: response
    )
  end
  private

  def boot_twilio
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end
end
