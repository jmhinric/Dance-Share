require 'spec_helper'
require 'login_helper'

describe "reviews" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:run) { FactoryGirl.create(:recent_week_run) }
  let!(:review) { FactoryGirl.create(:review, performance: run.performances.first) }

  it "can be upvoted by logged-in users" do
    login(user)
    visit company_path(run.company)
    click_link(run.title)
    expect(page).to have_content run.venue.name
    expect(page).to have_content "Reviews for"
    click_link "Vote Up"

    expect(page).to have_content "Voted Up"
  end

end
