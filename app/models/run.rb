class Run < ActiveRecord::Base
  belongs_to :venue
  belongs_to :company
  has_many :performances
end