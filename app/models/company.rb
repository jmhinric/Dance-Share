# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  admin_id   :integer
#  photo_url  :text
#  venue_name :string(255)
#

class Company < ActiveRecord::Base
  has_many :users, through: :artists
  has_many :pieces, through: :rep_pieces
  
  has_many :performances

  validates :name, :admin_id, presence: true
end
