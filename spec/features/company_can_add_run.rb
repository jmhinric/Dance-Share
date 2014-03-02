require 'spec_helper'

describe "a company should be able to create a run" do
  let(:user) { FactoryGirl.create(:user) }
  
  # let!(:company) { Company.create!(name: "This One Company", user: user) }
  let(:company) { FactoryGirl.create(:company) }
  # let!(:venue) { FactoryGirl.create(:venue) }
  let!(:run) { FactoryGirl.build(:run) }
  
  before(:each) do
    user.companies << company
    login(user)
    visit user_path(user)
    click_link company.name
  end

  it "lets a company create a run" do
    click_link "Add a Run of Performances"
    choose run.venue.name
    save_and_open_page
    fill_in "Title:", with: run.title
    click_button "Create Performance Run"

    expect(page).to have_content run.title
    expect(page).to have_content run.venue.name

    fill_in "Date", with: "04/02/2014"
    fill_in "Time", with: "08:00 PM"
    click_button "Save Run"

    expect(page).to have_content "April 2, 2014"
    expect(page).to have_content "8:00"
  end

  # it "lets a company add multiple performances to a run" do    

  #   fill_in "Date", with: "04/02/2014"
  #   fill_in "Time", with: "08:00 PM"
  #   click_button "Save Run"

  #   expect(page).to have_content "Run"
  #   expect(page).to have_content venue.name
  #   expect(page).to have_content company.name
  # end

  def login(user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
end