class Performance < ActiveRecord::Base
  belongs_to :company
  belongs_to :venue

  has_many :concerts
  has_many :reviews

  # has_many :venues, through: :concerts
  
  validates :date, :time, :venue_id, :company_id, presence: true
end