class CreateReviewVotes < ActiveRecord::Migration
  def change
    create_table :review_votes do |t|
      t.belongs_to :review
      t.belongs_to :user
      t.integer :value

      t.timestamps
    end
  end
end
