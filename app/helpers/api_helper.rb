require 'uri'
module Apihelper
  def get_restaurants
    begin
      require 'uri'
      require 'net/http'
      location = "portland"
      term = "delis"
      url = URI("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["authorization"] = ENV['ACCESS_TOKEN']


      response = http.request(request)

      puts response.read_body
    rescue
      puts 'API ERROR'
    end
  end
end
