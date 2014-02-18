class Piece < ActiveRecord::Base
  has_many :companies, through: :rep_pieces

  validates :choreographer, :title, presence: true
  validates_uniqueness_of :choreographer, scope: :title
end