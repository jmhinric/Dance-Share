class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance
  has_many :review_votes
  has_many :user_voters, through: :review_votes, source: :user

  validates :title, :review_text, :rating, :user_id, :performance_id, presence: true

  def voted_on?(user)
    return self.review_votes.find_by(user_id: user.id).present?
  end

  def compute_vote_total
    self.review_votes.sum(:value)
  end
  
end
