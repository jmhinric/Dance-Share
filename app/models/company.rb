# TODO Figure out foreign key alias
class Company < ActiveRecord::Base
  belongs_to :admin, class_name: "User", foreign_key: :user_id
  # belongs_to :user
  has_many :users, through: :artists
  has_many :artists
  has_many :pieces, through: :rep_pieces
  
  has_many :performances

  validates :name, :user_id, presence: true
end
