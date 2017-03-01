module ApiHelper

  def get_restaurants(term, location)
    begin
      RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}", headers={"authorization": ENV['ACCESS_TOKEN'] })
    rescue
      'Yelp API ERROR'
    end
  end

  def get_restaurants_price(term, location, price_point)
    begin
      RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}&price=#{price_point.length - 1}", headers={"authorization": ENV['ACCESS_TOKEN'] })
    rescue
      'Yelp API ERROR'
    end
  end
end
