class ReviewVote < ActiveRecord::Base
  belongs_to :user_voter, class_name: "User", foreign_key: 'user_id'
  belongs_to :voted_on_review, class_name: "Review", foreign_key: 'review_id'

  validates_uniqueness_of :review_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "is the author of the review" if voted_on_review.user_id == user_id
  end
end