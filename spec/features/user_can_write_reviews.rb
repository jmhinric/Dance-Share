require 'spec_helper'
require 'login_helper'

describe "user can write reviews of performances" do
  let(:user) { FactoryGirl.create(:user) }
  let(:run) { FactoryGirl.create(:recent_week_run) }
  let(:company) { FactoryGirl.create(:company) }

  it "lets users write reviews of performances" do
    login(user)
    

    click_link "Write a Review"
    

  end
end