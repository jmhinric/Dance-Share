class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :gender, :dob, presence: true
  
  has_many :performances
  has_many :reviews

end