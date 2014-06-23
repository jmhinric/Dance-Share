class RunsController < ApplicationController

  before_action :load_company, only: [:index, :new, :create, :show]

  def new
    @run = Run.new
    @venues = Venue.text_search(params[:search])
  end

  def create
    binding.pry
    @venue = Venue.find(params["venue_id"].to_i)
    @run = Run.create(title: params["run"]["title"], venue: @venue)
    @venue.runs << @run
    @company.runs << @run
    redirect_to company_run_path @company, @run
  end

  def show
    @run = Run.find(params[:id])
  end


  private

  def load_company
    if params["company_id"]
      @company = Company.find(params["company_id"])
    else
      @company = Company.find(params[:company_id])
    end
  end

end