class Piece < ActiveRecord::Base
  validates :choreographer, :title, presence: true
  validates_uniqueness_of :choreographer, scope: :title
end
