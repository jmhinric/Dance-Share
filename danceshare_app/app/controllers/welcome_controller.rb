class WelcomeController < ApplicationController

  def index
    @recent_performances = Performance.where(date: Time.now.since(-604800)...Date.today)
    @upcoming_performances = Performance.where(date: Date.today...Time.now.since(604800))
  end

end