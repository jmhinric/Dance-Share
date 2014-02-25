# == Schema Information
#
# Table name: venues
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  address           :string(255)
#  city              :string(255)
#  state_code        :string(255)
#  postal_code       :string(255)
#  cross_streets     :string(255)
#  country_code      :string(255)
#  neighborhoods     :string(255)
#  display_address   :string(255)
#  yelp_id           :string(255)
#  snippet_image_url :text
#  rating_image_url  :text
#  review_count      :integer
#  url               :text
#  full_api_data     :text
#  image_url         :text
#

class Venue < ActiveRecord::Base
  # has_and_belongs_to_many :performances
  # has_many :performances, through: :concerts
  has_many :performances

  validates :name, :yelp_id, :rating_image_url, :url, :display_address, :review_count, presence: true
  validates :yelp_id, uniqueness: true
end
