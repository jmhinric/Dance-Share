class Venue < ActiveRecord::Base
  # has_and_belongs_to_many :performances
  # has_many :performances, through: :concerts
  has_many :performances
end