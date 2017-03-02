module ApiHelper

  def get_restaurants(term, location)
    begin
      RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}", headers={"authorization": ENV['ACCESS_TOKEN'] })
    rescue
      "Yelp API ERROR"
    end
  end

  def get_restaurants_price(term, location, price_point)
    begin
      RestClient.get("https://api.yelp.com/v3/businesses/search?term=#{term}&location=#{location}&price=#{price_point.length - 1}", headers={"authorization": ENV['ACCESS_TOKEN'] })
    rescue
      "Yelp API ERROR"
    end
  end

  def getEstimatesForUserLocation
    begin
      start_latitude = 45.6318
      start_longitude = -122.6716
      end_latitude = 45.5231
      end_longitude = -122.6765
      RestClient.get("https://api.uber.com/v1.2/estimates/price?start_latitude=#{start_latitude}&start_longitude=#{start_longitude}&end_latitude=#{end_latitude}&end_longitude=#{end_longitude}", headers={ "authorization": ENV['YOUR_SERVER_TOKEN']})
      # Sort fastest times
    rescue
      "Error"
      ##include error messages
    end
  end

  # def get_google_map
  #   begin
  #     RestClient.get("http://maps.googleapis.com/maps/api/staticmap?zoom=17&format=png&sensor=false&size=280x280&maptype=roadmap&style=element:geometry.fill|color:0xf4f4f4&markers=color:red|40.725255,-73.996842&scale=2")
  #   rescue
  #     puts "Something went wrong"
  #   end
  # end

end
