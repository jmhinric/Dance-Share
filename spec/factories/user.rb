FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email } 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password "password"
    password_confirmation "password"
    gender "male"
    dob Date.today

    # factory :admin_user do
    #   after(:create) do |user|
    #     create(:admin_company, user: user)
    #   end
    # end
  end
end

