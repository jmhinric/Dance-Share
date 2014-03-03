FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    # association :user
    association :admin, factory: :user
    # factory :admin_company do
    # end
  end
end