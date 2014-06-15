class AddVoteTotaltoReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :vote_total, :integer
  end
end
