class VenuesController < ApplicationController

  # Works even if YelpHelper is not included!!
  include YelpHelper
  
  def new
    # binding.pry
    # @venues = YelpHelper::ask_for_theaters(params[:venue_name])
    # @venues = venue_selection(params[:company][:venue_name])
    @company = Company.find(params[:company_id])
    @venues = venue_selection(params[:venue_name], @company.id)
  end


# TODO Refactor this hack method of passing the company id through the venue entity under the 'search_query' attribute
  def create
    # binding.pry
    @company = Company.find(params["search_query"])
    # if params[:venue_name].nil?
    #   redirect_to new_company_performance_path(@company)
    # else
    #   @venues = venue_selection(params[:search_query]) 
    #   @venue = @venues.select {|venue| venue[:name] == params[:venue_name] }.first

      Venue.create(
        name: params["name"],
        display_address: params["display_address"],
        cross_streets: params["cross_streets"],
        address: params["address"],
        city: params["city"],
        state_code: params["state_code"],
        postal_code: params["postal_code"],
        image_url: params["image_url"],
        url: params["url"],
        rating_image_url: params["rating_image_url"],
        yelp_id: params["yelp_id"],
        review_count: params["review_count"]
        )
      redirect_to new_company_run_path(@company)
    # end
  end


  private

    def venue_selection(search_term, company_id)
      @venues = YelpHelper::ask_for_theaters(search_term, company_id)
    end

end