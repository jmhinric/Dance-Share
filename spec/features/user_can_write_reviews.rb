require 'spec_helper'
require 'login_helper'

describe "create reviews of performances" do
  let(:user) { FactoryGirl.create(:user) }
  # let!(:company) { FactoryGirl.create(:company) }
  let!(:run) { FactoryGirl.create(:recent_week_run) }

  it "lets users write reviews of performances" do
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

  it "requires a user to be logged-in" do
    visit root_path
    save_and_open_page
    click_link "Reviews | Write a Review"
    expect(page).to have_content run.company.name
    first(:link, "Write a Review").click

    expect(page).to have_content "Please Log In"
  end
end