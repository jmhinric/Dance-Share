# == Schema Information
#
# Table name: performances
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  venue_id    :integer
#  date        :date
#  time        :time
#  pretty_date :string(255)
#  pretty_time :string(255)
#  company_id  :integer
#

class Performance < ActiveRecord::Base
  belongs_to :company
  belongs_to :venue

  has_many :concerts
  has_many :reviews

  # has_many :venues, through: :concerts
  
  validates :date, :time, :venue_id, :company_id, presence: true
end
