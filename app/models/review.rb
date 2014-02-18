class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance

  validates :title, :review_text, :rating, :user_id, :performance_id, presence: true
end