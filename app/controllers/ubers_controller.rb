class UbersController < ApplicationController
  include ApiHelper
  def index
    @response = JSON.parse(getEstimatesForUserLocation)
    @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
  end

  def get_route
    @response = JSON.parse(getEstimatesForUserLocation)
    @fastest_ride = @response['prices'].sort_by{ |hash| hash['duration'] }.first['duration']/60
    respond_to do |format|
      format.html { redirect_to ubers_path }
      format.js
    end
  end
end
