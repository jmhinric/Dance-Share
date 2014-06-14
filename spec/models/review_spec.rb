require 'spec_helper'

describe Review do
  before(:each) do
    FactoryGirl.create(:review)
  end

  it { should belong_to(:user) }
  it { should belong_to(:performance) }
  it { should have_many(:review_votes) }
  it { should have_many(:user_voters).through(:review_votes) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:review_text) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:performance_id) }

  describe "#voted_on?" do
      let(:review) { FactoryGirl.create(:review) }
      let(:user) { FactoryGirl.create(:user) }
    it "checks to see if a review has been voted on by a given user" do
      
      expect(review.voted_on?(user)).to be_false
      
      review_vote = ReviewVote.create(user_id: user.id, review_id: review.id, value: 1)

      review.review_votes << review_vote
      review.save
      
      expect(review.voted_on?(user)).to be_true
    end
  end


  describe "#vote_total" do

    let!(:user1) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }
    let!(:review) { FactoryGirl.create(:review) }

    it "returns the net votes for a review" do
      ReviewVote.create(user_id: user1.id, review_id: review.id, value: 1)
      ReviewVote.create(user_id: user2.id, review_id: review.id, value: 1)
      
      expect(review.vote_total).to be 2

    end

  end
  
end