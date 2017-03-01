module ApiHelper

  def get_restaurants(location, term)
    begin
      request = RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}", headers={"authorization": ENV['ACCESS_TOKEN'] })
      request.truncate(30)
    rescue
      return 'Yelp API ERROR'
    end
  end
end
