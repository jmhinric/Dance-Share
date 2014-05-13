require 'spec_helper'
require 'login_helper'

describe "reviews" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:run) { FactoryGirl.create(:recent_week_run) }
  let!(:review) { FactoryGirl.create(:review, performance: run.performances.first) }

  it "can be written by logged-in users" do
    login(user)
    visit root_path
    click_link "Reviews | Write a Review"
    expect(page).to have_content run.company.name

    first(:link, "Write a Review").click
    expect(page).to have_content "Write a Review!"

    fill_in "Title", with: "My Title"
    fill_in :review_review_text, with: "Review text here."
    choose "review_rating_1"
    click_button "Create Review"

    expect(page).to have_content "My Reviews"
    expect(page).to have_content "My Title"
    expect(page).to have_content "Review text here."
  end

  it "cannot be written if not logged-in" do
    visit root_path
    # save_and_open_page
    click_link "Reviews | Write a Review"
    expect(page).to have_content run.company.name
    first(:link, "Write a Review").click

    expect(page).to have_content "Please Log In"
  end

  it "can be upvoted by logged-in users" do
    # save_and_open_page
    login(user)
    visit company_path(run.company)
    click_link(run.title)
    expect(page).to have_content run.venue.name
    expect(page).to have_content "Reviews for"
    click_link "Vote Up"
  end

end






















