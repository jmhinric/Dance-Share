FactoryGirl.define do
  factory :review_vote do
    value [1, -1].sample
    association :user, factory: :user
    association :review
  end
end