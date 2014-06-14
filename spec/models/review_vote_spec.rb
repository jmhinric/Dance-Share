require 'spec_helper'

describe ReviewVote do

  it { should belong_to(:user_voter).with_foreign_key('user_id') }
  it { should belong_to(:voted_on_review).with_foreign_key('review_id') }

  # TODO figure out these tests

  it { should validate_uniqueness_of(:review_id).scoped_to(:user_id).with_message('already exists') }
  
  # it { should ensure_inclusion_of(:value).in_array([1, -1]) }

  # describe "#ensure_not_author" do

  #   it "ensures the author of the review can't vote on the review" do
      

  #   end

  # end

end

