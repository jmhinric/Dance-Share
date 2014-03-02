FactoryGirl.define do
  factory :run do
    title { Faker::Lorem.sentence(word_count = 3) }
    association :venue
    association :company
  end
end