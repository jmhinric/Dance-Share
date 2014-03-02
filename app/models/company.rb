class Company < ActiveRecord::Base
  belongs_to :admin, class_name: "User", foreign_key: :user_id
  has_many :users, through: :artists
  has_many :artists
  # has_many :pieces, through: :rep_pieces
  
  # has_many :performances
  has_many :runs

  validates :name, :user_id, presence: true
end
