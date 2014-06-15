class ReviewVotesController < ApplicationController
  def create
    @review = Review.find(params["id"])
    value = params["vote"] == "Up" ? 1 : -1

    @review_vote = ReviewVote.create(
      user_id: current_user.id,
      review_id: @review.id,
      value: value
    )

    unless @review_vote.id.nil?
      @review.review_votes << @review_vote
      @review.vote_total = @review.compute_vote_total
      @review.save

      current_user.review_votes << @review_vote
      current_user.save

      render json: { review_id: @review.id, vote_count: @review.compute_vote_total }
    else
      render json: { review: nil }
    end
  end
  
end