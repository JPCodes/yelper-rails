require 'sidekiq-scheduler'
class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    yelp_query = "Restaurants Portland"
    new_response = YelpResponse.new(yelp_query)
    response = new_response.random_response
    boot_twilio
    sms = @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['JAMES'],
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
