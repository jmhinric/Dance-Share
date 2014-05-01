FactoryGirl.define do
  factory :review do
    title { Faker::Lorem.words(count=3).each {|w| w.capitalize!}.join(" ") }
    review_text { Faker::Lorem.paragraphs.join(",") }
    rating { [1,2,3,4,5].sample }
    association :user, factory: :user
    association :performance, factory: :performance
  end
end