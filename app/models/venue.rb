class Venue < ActiveRecord::Base
  # has_and_belongs_to_many :performances
  # has_many :performances, through: :concerts
  has_many :performances

  validates :name, :yelp_id, :rating_image_url, :url, :display_address, :review_count, presence: true
  validates :yelp_id, uniqueness: true
end