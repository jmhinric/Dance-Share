class Venue < ActiveRecord::Base
  has_many :runs

  validates :name, :yelp_id, :rating_image_url, :url, :display_address, :review_count, presence: true
  validates :yelp_id, uniqueness: true
end
