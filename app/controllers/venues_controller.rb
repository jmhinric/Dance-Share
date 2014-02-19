class VenuesController < ApplicationController

  before_action :load_company

  def new
    # @venues = YelpHelper::ask_for_theaters(params[:venue_name])
    @venues = YelpHelper::ask_for_theaters(params[:company][:venue_name])
  end

  def create
    if params[:venue_name].nil?
      redirect_to new_company_performance_path(@company)
    else
      @venues = YelpHelper::ask_for_theaters(params[:search_query]) 
      @venue = @venues.select {|venue| venue[:name] == params[:venue_name] }.first

      Venue.create(
        name: @venue[:name],
        display_address: @venue[:display_address],
        cross_streets: @venue[:cross_streets],
        address: @venue[:address],
        city: @venue[:city],
        state_code: @venue[:state_code],
        postal_code: @venue[:postal_code],
        image_url: @venue[:image_url],
        url: @venue[:url],
        rating_image_url: @venue[:rating_image_url],
        yelp_id: @venue[:yelp_id],
        review_count: @venue[:review_count]
        )
      redirect_to new_company_performance_path(@company)
    end
  end


  private

    def load_company
       @company = Company.find(params[:company_id])
    end

    # def create_venue(yelp)
    #   Venue.create(
    #     name: yelp["businesses"][0]["name"],
    #     display_address: yelp["businesses"][0]["location"]["display_address"].join("\n"),
    #     cross_streets: yelp["businesses"][0]["location"]["cross_streets"],
    #     address: yelp["businesses"][0]["location"]["address"].first,
    #     city: yelp["businesses"][0]["location"]["city"],
    #     state_code: yelp["businesses"][0]["location"]["state_code"],
    #     postal_code: yelp["businesses"][0]["location"]["postal_code"],
    #     image_url: yelp["businesses"][0]["image_url"],
    #     url: yelp["businesses"][0]["url"],
    #     rating_image_url: yelp["businesses"][0]["rating_img_url"],
    #     yelp_id: yelp["businesses"][0]["id"],
    #     review_count: yelp["businesses"][0]["review_count"]
    #     ) 
    # end

end