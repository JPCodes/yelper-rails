module ApiHelper

  def get_restaurants(term, location)
    begin
      RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}", headers={"authorization": ENV['ACCESS_TOKEN'] })
    rescue
      'Yelp API ERROR'
    end
  end
end
