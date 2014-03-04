require 'spec_helper'
require 'login_helper'

describe "user can write reviews of performances" do
  let(:user) { FactoryGirl.create(:user) }
  let(:run) { FactoryGirl.create(:recent_week_run) }

  it "lets users write reviews of performances" do
    login(user)
    expect(page).to have_content run.performance.title

    click_link "Write a Review"
    

  end
end