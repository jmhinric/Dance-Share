FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    association :user
    # association :admin, factory: :user
  end
end