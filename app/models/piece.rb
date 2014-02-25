# == Schema Information
#
# Table name: pieces
#
#  id            :integer          not null, primary key
#  choreographer :string(255)
#  title         :string(255)
#  premiere_date :date
#  photo_url     :text
#

class Piece < ActiveRecord::Base
  has_many :companies, through: :rep_pieces

  validates :choreographer, :title, presence: true
  validates_uniqueness_of :choreographer, scope: :title
end
