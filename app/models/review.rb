# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  review_text    :text
#  rating         :integer
#  user_id        :integer
#  performance_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance

  validates :title, :review_text, :rating, :user_id, :performance_id, presence: true
end
