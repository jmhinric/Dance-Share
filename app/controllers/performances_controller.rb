class PerformancesController < ApplicationController

  before_action :load_company, only: [:index, :show, :new, :create]
  before_action :load_performance, only: [:show, :update, :destroy]
  # before_action :authenticate
  before_action :admin_authorize, only: [:new, :create]

  def index
    @performances = @company.performances
  end

  def show
    @venue = @performance.venue
  end

  def new
    @venue = Venue.new
    @venues = Venue.all
  end

  def create
    @venue = Venue.find(params[:selected_venue].to_i)

    @performance = Performance.create(
      title: "#{@company.name}", 
      date: params[:date],
      time: params[:time],
      pretty_date: params[:date].to_date.strftime("%A, %B %e, %Y"),
      pretty_time: params[:time].to_datetime.strftime("%l:%M %p")
      )
      
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

end