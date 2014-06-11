FactoryGirl.define do
  factory :video do
    author { Faker::Name } 
    title { Faker::Lorem.sentence }
    sub_title { Faker::Lorem.sentence }
    category { Faker::Lorem.word }
    sub_category { Faker::Lorem.word }
    description { Faker::Lorem.sentences(sentence_count = 3).join('') }
    url { Faker::Internet.http_url }
    video_id { random_hex }

    association :user, factory: :user
  end
end

def random_hex
  hex = ("a".."z").to_a + (0..9).to_a
  hex.map { |i| i.to_s }
  hex.sample(11).join("")
end

