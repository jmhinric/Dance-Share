class RunsController < ApplicationController

  before_action :load_company, only: [:new, :create, :show]

  def new
    
    @venues = Venue.all
  end

  def create
    @venue = Venue.find(params[:selected_venue].to_i)
    @run = Run.create(title: params[:title], venue: @venue)
    @venue.runs << @run
    @company.runs << @run
    
    redirect_to company_run_path(@company, @run)
  end

  def show
  end


  private

  def load_company
    @company = Company.find(params[:company_id])
  end

end