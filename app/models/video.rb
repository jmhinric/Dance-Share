class Video < ActiveRecord::Base
  belongs_to :user

  validates :author, :title, :sub_title, :category, :sub_category, :description, :video_id, presence: true
end