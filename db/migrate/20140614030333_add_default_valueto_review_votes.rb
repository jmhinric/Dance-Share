class AddDefaultValuetoReviewVotes < ActiveRecord::Migration
  def change
    change_column_default :review_votes, :value, 0
  end
end
