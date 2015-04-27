require 'open-uri'
require 'uri'

class WelcomeController < ApplicationController
	include HTTParty
	helper :welcome

  def index
    # Check search box for input
    if params[:search] != nil
      # Encode the search query and send it to Google
      @user_query = URI.encode(params[:search])
      @results    = GooglePlacesApi.query(@user_query)
  	end
    
  end

  def show    
    # Query search result for details
    @details = GooglePlacesApi.details(params[:id])
    @loc = params[:id]
  end

  def new
    @place = GooglePlacesApi.new
    
    data = [params[:address], params[:city], params[:state]]
    address = data.join(", ")

    @address = URI.encode(address)
    @geocode = GooglePlacesApi.geocode(@address)
  end
end
