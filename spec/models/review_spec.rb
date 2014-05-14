require 'spec_helper'

describe Review do
  before(:each) do
    FactoryGirl.create(:review)
  end

  it { should belong_to(:user) }
  it { should belong_to(:performance) }
  it { should have_many(:review_votes) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:review_text) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:performance_id) }
  
end