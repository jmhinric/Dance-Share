class User < ActiveRecord::Base
  
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  
  has_many :reviews
  has_many :review_votes
  has_many :artists
  has_many :companies, through: :artists
  has_many :videos
end
