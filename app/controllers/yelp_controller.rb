class YelpController < ApplicationController
  include ApiHelper

  def index
  end

  def create
    price_point = " " + search_params[:price_point]
    @found_businesses = JSON.parse(get_restaurants_price(search_params[:term], search_params[:city], price_point))
    @businesses = @found_businesses['businesses']
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end


  private
  def search_params
    params.permit(:term, :city, :price_point)
  end
end
