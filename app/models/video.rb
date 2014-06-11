class Video < ActiveRecord::Base
  belongs_to :user

  validates :author, :title, :category, :sub_category, :description, :video_id, presence: true


  def youtube_url(id)
    "http://www.youtube.com/embed/#{id}"
  end


  # http://justinlee.sg/2013/07/17/how-to-get-the-url-of-the-various-sizes-of-youtube-thumbnail-image/

  # 320x180 res, others are available at the above website
  def youtube_photo(id)
    "http://img.youtube.com/vi/#{id}/mqdefault.jpg"
  end
end