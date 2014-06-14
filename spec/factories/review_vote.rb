FactoryGirl.define do
  factory :review_vote do
    value [1, -1].sample
    :user_voter
    :voted_on_review
  end
end