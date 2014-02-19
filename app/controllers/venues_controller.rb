class VenuesController < ApplicationController

  def new
    @venues = YelpHelper::ask_for_theaters(params[:venue_name])
  end

  def create

  end

end