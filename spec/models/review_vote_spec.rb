require 'spec_helper'

describe ReviewVote do
  before(:each) do
    FactoryGirl.create(:review_vote)
  end

  it { should belong_to(:user) }
  it { should belong_to(:review) }

  it { should validate_uniqueness_of(:review_id).scoped_to(:user_id) }
  # it { should ensure_inclusion_of(:value).in_array(%w(-1, 1)) }
end