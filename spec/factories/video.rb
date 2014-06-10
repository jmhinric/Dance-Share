FactoryGirl.define do
  factory :video do
    author { Faker::Name } 
    title { Faker::Lorem.sentence }
    sub_title { Faker::Lorem.sentence }
    category { Faker::Lorem.word }
    sub_category { Faker::Lorem.word }
    description { Faker::Lorem.sentences(sentence_count = 3).join('') }
    url { Faker::Internet.http_url }

    association :user, factory: :user
  end
end

