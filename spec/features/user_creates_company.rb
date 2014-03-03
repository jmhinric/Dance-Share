require 'spec_helper'
require 'login_helper'

describe "user creates a dance company" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:company) { FactoryGirl.create(:company, admin: user)}

  it "allows a User to create a company" do
    login(user)
    click_link "#{user.first_name}'s Profile"
    expect(page).to have_content user.first_name

    click_link "Create a Dance Company"
    fill_in "Name", with: "Super Strongs"
    fill_in "Photo url", with: "http://www.example.com"
    click_button "Create Company"
    expect(page).to have_content "Super Strongs"
  end

  it "allows the User to edit the Company profile" do
    user.companies << company
    login(user)
    click_link "#{user.first_name}'s Profile"
    click_link company.name
    expect(page).to have_content "#{company.name} Profile"

    click_link "Edit Profile"
    fill_in "Name", with: "New Company"
    click_button "Update Profile"
    expect(page).to have_content "New Company Profile"
    save_and_open_page
  end
  
end