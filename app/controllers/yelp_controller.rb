class YelpController < ApplicationController
  include ApiHelper
  def index
  end

  def create
    price_point = " " + search_params[:price_point]
    @businesses = JSON.parse(get_restaurants_price(search_params[:term], search_params[:city], price_point))
    respond_to do |format|
      format.html { redirect_to yelp_index_path }
      format.js
    end
  end

  def show

  end

  private
  def search_params
    params.permit(:term, :city, :price_point)
  end
end
