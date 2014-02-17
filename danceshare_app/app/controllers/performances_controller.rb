class PerformancesController < ApplicationController

  before_action :load_company, only: [:index, :show, :new, :create]
  before_action :load_performance, only: [:show, :update, :destroy]

  def index
    @performances = @company.performances
  end

  def show
    @venue = @performance.venue
  end

  def new
  end

  def create
    @venue = yelp_call(params[:venue_name])
    @performance = Performance.create(
      title: "#{@company.name}", 
      date: params[:date],
      time: params[:time]
      )
    @performance.pretty_date = @performance.date.strftime("%A, %B %e, %Y")
    @performance.pretty_time = @performance.time.strftime("%l:%M %p")
      
    @venue.performances << @performance  
    @company.performances << @performance
    redirect_to company_performance_path(@company, @performance)
  end




  private

    def load_company
      @company = Company.find(params[:company_id])
    end

    def load_performance
      @performance = Performance.find(params[:id])
    end

    def yelp_call(theater)

      search_theater = theater.gsub(" ", "+")

      consumer_key = YELP_CONSUMER_KEY
      consumer_secret = "#{YELP_CONSUMER_SECRET}"
      token = "#{YELP_TOKEN}"
      token_secret = "#{YELP_TOKEN_SECRET}"

      api_host = 'api.yelp.com'

      consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
      access_token = OAuth::AccessToken.new(consumer, token, token_secret)

      path = "/v2/search?term=#{search_theater}+performing+arts&location=new+york"
      
      yelp_search = access_token.get(path).body

      yelp = JSON(yelp_search)

      # binding.pry
      return Venue.create(
        name: yelp["businesses"][0]["name"],
        display_address: yelp["businesses"][0]["location"]["display_address"].join("\n"),
        image_url: yelp["businesses"][0]["image_url"],
        url: yelp["businesses"][0]["url"],
        rating_image_url: yelp["businesses"][0]["rating_img_url"],
        yelp_id: yelp["businesses"][0]["id"],
        review_count: yelp["businesses"][0]["review_count"]
        )
    end

end