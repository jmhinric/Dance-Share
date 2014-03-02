class Performance < ActiveRecord::Base
  belongs_to :run
  has_many :reviews

  validates :date, :time, :run_id, presence: true
end
