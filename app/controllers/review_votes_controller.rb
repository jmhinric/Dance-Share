class ReviewVotesController < ApplicationController
  def create
    @review = Review.find(params["id"])
    review_id = @review.id
    user_id = current_user.id
    value = params["vote"] == "up" ? 1 : -1

    @review_vote = ReviewVote.create(
      user_id: user_id,
      review_id: review_id,
      value: value
    )
    # if @review_vote.save
      @review.review_votes << @review_vote
      current_user.review_votes << @review_vote
      @review.save
      current_user.save
      render json: { review: @review,vote_count: @review.review_votes.sum(value) }
    # end
      # render json: { review: nil }
  end
  
  # private

  # def strong_params
  #   params.require(:review).permit("id")
  # end
end