class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :gender, :dob, presence: true
end