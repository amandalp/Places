require 'open-uri'
require 'uri'

class PlacesController < ApplicationController
  include HTTParty
  helper :places

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

end
