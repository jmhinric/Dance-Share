class Performance < ActiveRecord::Base
  belongs_to :user
  has_many :concerts
  # has_many :venues, through: :concerts
  belongs_to :venue

  validates :date, :time, presence: true
end