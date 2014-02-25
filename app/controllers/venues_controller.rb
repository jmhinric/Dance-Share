class VenuesController < ApplicationController

  # Works even if YelpHelper is not included!!
  include YelpHelper
  
  before_action :load_company

  def new
    # binding.pry
    # @venues = YelpHelper::ask_for_theaters(params[:venue_name])
    @venues = venue_selection(params[:company][:venue_name])
  end

  def create
    # if params[:venue_name].nil?
    #   redirect_to new_company_performance_path(@company)
    # else
    #   @venues = venue_selection(params[:search_query]) 
    #   @venue = @venues.select {|venue| venue[:name] == params[:venue_name] }.first

      Venue.create(
        name: params[:name],
        display_address: params[:display_address],
        cross_streets: params[:cross_streets],
        address: params[:address],
        city: params[:city],
        state_code: params[:state_code],
        postal_code: params[:postal_code],
        image_url: params[:image_url],
        url: params[:url],
        rating_image_url: params[:rating_image_url],
        yelp_id: params[:yelp_id],
        review_count: params[:review_count]
        )
      redirect_to new_company_performance_path(@company)
    # end
  end


  private

    def load_company
       @company = Company.find(params[:company_id])
    end

    def venue_selection(search_term)
      @venues = YelpHelper::ask_for_theaters(search_term)
    end

end