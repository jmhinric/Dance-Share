class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :gender, :dob, presence: true
  validates :email, uniqueness: true
  
  has_many :reviews
  has_many :companies, through: :artists

end