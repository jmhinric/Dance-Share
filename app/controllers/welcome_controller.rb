class WelcomeController < ApplicationController

  def index
    @recent_performances = Performance.where(date: Time.now.since(-604800)...Date.today).order(:date)
    @upcoming_performances = Performance.where(date: Date.today...Time.now.since(604800)).order(:date)
  end

end