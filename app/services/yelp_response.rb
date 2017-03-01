include ApiHelper
class YelpResponse
  def initialize(body)
    # What the person texts in
    @body = body
  end

  def process_response
    if @body.split.length == 2
      get_restaurants(@body.downcase.split[0], @body.downcase.split[1])
    else
      return "Please enter your request in the following format: 'Term' 'Location'. Ex: 'Delis Portland'"
    end
  end
end
