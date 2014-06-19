class VenuesController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @venues = venue_selection(params[:venue_name], @company.id)
  end


# TODO Refactor this hack method of passing the company id through the venue entity under the 'search_query' attribute
  def create
    @company = Company.find(params["search_query"])
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
  end


  private

    def venue_selection(search_term, company_id)
      @venues = YelpHelper::ask_for_theaters(search_term, company_id)
    end

end