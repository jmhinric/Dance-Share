class Run < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :venue
  belongs_to :company
  has_many :performances

end