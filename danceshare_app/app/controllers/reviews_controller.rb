class ReviewsController < ApplicationController

  before_action :load_user
  before_action :load_performance
  # before_action :is_admin?, only: [:new, :create, :edit]
  before_action :logged_in?

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)    
    @user.reviews << @review
    @performance.reviews << @review
    
    if @review.save
      @user = @performance.user
      redirect_to user_performance_path(@user, @performance)
    else
      render :new
    end
  end


  private

    def load_user
      @user = current_user
    end

    def load_performance
      @performance = Performance.find(params[:performance_id])
    end

    def review_params
      params.require(:review).permit(:title, :review_text, :rating)
    end

end