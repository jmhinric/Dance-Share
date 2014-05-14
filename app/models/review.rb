class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance
  has_many :review_votes

  validates :title, :review_text, :rating, :user_id, :performance_id, presence: true
end
