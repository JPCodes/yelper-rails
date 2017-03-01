include ApiHelper
class YelpResponse
  def initialize(body)
    # What the person texts in
    @body = body
  end

  def process_response
    if @body.split.length == 2
      api_response = get_restaurants(@body.downcase.split[0], @body.downcase.split[1])
      parsed_api_response = JSON.parse(api_response)
      @response = ''
      @i = 0
      while @i < 4  do
        business_address = parsed_api_response['businesses'][@i]['location']['address1']
        business_name = parsed_api_response['businesses'][@i]['name']
        business_rating = parsed_api_response['businesses'][@i]['rating']
        @response.concat("\n#{business_name} (#{business_address}, #{business_rating}). \n")
        @i +=1
      end
      return @response
    else
      "Please enter your request in the following format: 'Term' 'Location'. Ex: 'Delis Portland'"
    end
  end
end
