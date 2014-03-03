class PerformancesController < ApplicationController

  before_action :load_run, only: [:new, :create]
  # before_action :load_performance, only: [:show, :update, :destroy]
  # before_action :authenticate
  # before_action :admin_authorize, only: [:new, :create]

  # def index
  #   @performances = @company.performances
  # end

  # def show
  #   @venue = @performance.venue
  # end

  def new
  end

  def create
    # @venue = Venue.find(params[:selected_venue].to_i)
    @performance = Performance.create(
      # title: "#{@company.name}", 
      date: params["performance"]["date"],
      time: params["performance"]["time"],
      pretty_date: params["performance"]["date"].to_date.strftime("%A, %B %e, %Y"),
      pretty_time: params["performance"]["time"].to_datetime.strftime("%l:%M %p")
      )
    @run.performances << @performance
      
    # @venue.performances << @performance  
    # @company.performances << @performance
    redirect_to company_run_path(@run.company, @run)
  end


  private


    def load_run
      @run = Run.find(params[:run_id])
    end

    # def load_company
    #   @company = Company.find(params[:company_id])
    # end
end