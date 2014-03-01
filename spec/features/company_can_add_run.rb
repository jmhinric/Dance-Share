require 'spec_helper'

describe "a company should be able to add a run" do
  # let(:user) { FactoryGirl.create(:user) }
  # admin.companies << 
  # let!(:company) { Company.create!(name: "This One Company", user: user) }
  let(:company) { FactoryGirl.create(:company) }

  it "lets a company create a run" do
    login(company.user)
    visit user_path(company.user)
    save_and_open_page
    click_link company.name
    click_link "Add Run"
    choose venue.name
    fill_in "Title", with: company.name
    fill_in "Date", with: "04/01/2014"
    fill_in "Time", with: "07:00 PM"
    click_button "Add Performance"

    expect(page).to have_content "Run"
    expect(page).to have_content venue.name
    expect(page).to have_content company.name
    expect(page).to have_content "7:00"

    fill_in "Date", with: "04/02/2014"
    fill_in "Time", with: "08:00 PM"
    click_button "Save Run"

    expect(page).to have_content "Run"
    expect(page).to have_content venue.name
    expect(page).to have_content company.name
    expect(page).to have_content "8:00"

  end

  it "lets a company add multiple performances to a run" do

  end

  def login(user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button "Log in"
  end
end