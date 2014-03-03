FactoryGirl.define do
  factory :venue do
    name { Faker::Company.name }
    sequence :yelp_id do |n| 
      n 
    end
    image_url "http://twitter.com"
    rating_image_url "http://google.com"
    url "http://facebook.com"
    display_address { Faker::Address.street_address }
    review_count 5
  end
end