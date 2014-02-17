class Company < ActiveRecord::Base
  has_many :users, through: :artists
  has_many :pieces, through: :rep_pieces
  
  has_many :performances

  validates :name, :admin_id, presence: true
end