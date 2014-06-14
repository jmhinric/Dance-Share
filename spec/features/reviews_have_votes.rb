require 'spec_helper'
require 'login_helper'

describe "reviews" do
  before(:all) do
    Capybara.current_driver = :webkit
  end

  let!(:run) { FactoryGirl.create(:recent_week_run) }
  let!(:review) { FactoryGirl.create(:review, performance: run.performances.first) }
  let!(:user) { FactoryGirl.create(:user) }

  it "can be upvoted by logged-in users", js: true do
    login(user)
    visit company_path(run.company)
    click_link(run.title)
    
    expect(page).to have_content run.venue.name
    expect(page).to have_content "Reviews for"

    click_button "Vote Up"

    expect(page).to have_content "Voted Up"
    page.find(".vote-count").should have_content "1"
  end

  after(:all) do
    Capybara.use_default_driver
  end

end
