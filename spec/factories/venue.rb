FactoryGirl.define do
  factory :venue do
    name { Faker::Company.name }
    yelp_id { |n| n }
    image_url "http://twitter.com"
    rating_image_url "http://google.com"
    url "http://facebook.com"
    display_address { Faker::Address.street_address }
    review_count 5
  end
end

# validates :name, :yelp_id, :rating_image_url, :url, :display_address, :review_count, presence: true