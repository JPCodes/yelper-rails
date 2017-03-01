include ApiHelper
class YelpResponse
  def initialize(body)
    # What the person texts in
    @body = body
  end

  def process_response
    if @body.split(',').length == 3
      api_response = get_restaurants_price(@body.downcase.split(',')[0], @body.downcase.split(',')[1], @body.downcase.split(',')[2])
      parsed_api_response = JSON.parse(api_response)
      if parsed_api_response['businesses'].length > 3
        @response = ''
        @i = 0
        while @i <= 4  do
          business_address = parsed_api_response['businesses'][@i]['location']['address1']
          business_name = parsed_api_response['businesses'][@i]['name']
          business_rating = parsed_api_response['businesses'][@i]['rating']
          @response.concat("\n#{business_name} (#{business_address}, #{business_rating}). \n")
          @i +=1
        end
        @response
      else
        "Please try another search, Ex: 'Delis, Portland, $$'"
      end
    elsif @body.split(',').length == 2
      api_response = get_restaurants(@body.downcase.split(',')[0], @body.downcase.split(',')[1])
      parsed_api_response = JSON.parse(api_response)
      if parsed_api_response['businesses'].length > 3
        @response = ''
        @i = 0
        while @i <= 4  do
          business_address = parsed_api_response['businesses'][@i]['location']['address1']
          business_name = parsed_api_response['businesses'][@i]['name']
          business_rating = parsed_api_response['businesses'][@i]['rating']
          @response.concat("\n#{business_name} (#{business_address}, #{business_rating}). \n")
          @i +=1
        end
        @response
      else
        "Please try another search, Ex: 'Delis, Portland'"
      end
    else
      "Please enter your request in the following format: Term, Location. Ex: 'Delis, Portland'"
    end
  end

  def random_response
    api_response = get_restaurants(@body.downcase.split[0], @body.downcase.split[1])
    parsed_api_response = JSON.parse(api_response)
    @response = ''
    rng = Random.new
    @i = rng.rand(20)
      business_address = parsed_api_response['businesses'][@i]['location']['address1']
      business_name = parsed_api_response['businesses'][@i]['name']
      business_rating = parsed_api_response['businesses'][@i]['rating']
      @response.concat("\n#{business_name} (#{business_address}, #{business_rating}). \n")
    @response
  end
end
