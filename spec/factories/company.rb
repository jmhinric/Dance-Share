FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    association :admin, factory: :user
  end
end