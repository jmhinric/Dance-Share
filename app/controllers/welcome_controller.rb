class WelcomeController < ApplicationController

  def index
    @companies = Company.all.order(:name)
    
    unless Video.all.empty?
      @videos = Video.all
    end

    unless Review.all.empty?
      @reviews = Review.where("id > #{Review.count - 5}").order(:created_at)
    end

    unless Run.all.empty?
      @recent_runs = get_recent_runs(Run.all)
      @upcoming_runs = get_upcoming_runs(Run.all)
    end
  end


  private

  def get_recent_runs(runs)
    runs.select do |run|
      run.performances.present? && Time.now.since(-604800) < run.performances.order(:date).last.date && run.performances.order(:date).last.date < Time.now
    end
  end

  def get_upcoming_runs(runs)
    runs.select do |run|
      run.performances.present? && Time.now < run.performances.order(:date).first.date && run.performances.order(:date).first.date < Time.now.since(604800)
    end
  end

end