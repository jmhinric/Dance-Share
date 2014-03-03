class Venue < ActiveRecord::Base
  has_many :runs

  validates :name, :yelp_id, :rating_image_url, :url, :display_address, :review_count, presence: true
  validates :yelp_id, uniqueness: true

  include PgSearch
  pg_search_scope :search, against: [:name, :display_address], using: {tsearch: {dictionary: "english"}}#, associated_against: {runs: :company}

  def self.text_search(query)
    if query.present?
      search(query)
      # where("name @@ :s", s: query)
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      # scoped
      find(:all)
    end
  end

end
