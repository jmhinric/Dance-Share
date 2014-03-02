FactoryGirl.define do
  factory :performance do
    date Time.now
    time Time.now
    
    association :run
  end
end