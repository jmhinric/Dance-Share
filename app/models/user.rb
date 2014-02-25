# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  gender          :string(255)
#  dob             :date
#  photo_url       :text
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :gender, :dob, presence: true
  validates :email, uniqueness: true
  
  has_many :reviews
  has_many :companies, through: :artists

end
