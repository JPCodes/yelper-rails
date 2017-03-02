class UbersController < ApplicationController
  include ApiHelper
  def index
    if params[:latitude] && params[:longitude]
      @name = params[:name]
      @end_latitude = params[:latitude]
      @end_longitude = params[:longitude]
      @response = JSON.parse(getEstimatesForUserLocation(@end_latitude, @end_longitude))
      @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
      @map = "http://maps.googleapis.com/maps/api/staticmap?zoom=17&format=png&sensor=false&size=280x280&maptype=roadmap&style=element:geometry.fill|color:0xf4f4f4&markers=color:red|" + @end_latitude + "," + @end_longitude + "&scale=2&key=" + ENV['GOOGLE_API_KEY']
    end
    # @get_map = get_google_map
  end

  def get_route
    if params[:latitude] && params[:longitude]
      @name = params[:name]
      @end_latitude = params[:latitude]
      @end_longitude = params[:longitude]
      @response = JSON.parse(getEstimatesForUserLocation(@end_latitude, @end_longitude))
      @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
    end
    respond_to do |format|
      format.html { redirect_to ubers_path }
      format.js
    end
  end
end
