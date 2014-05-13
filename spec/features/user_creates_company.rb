require 'spec_helper'
require 'login_helper'

describe "user creates a dance company" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:company) { FactoryGirl.create(:company)}

  it "allows a User to create a company" do
    login(user)
    click_link "#{user.first_name}'s Profile"
    expect(page).to have_content user.first_name

    click_link "Create a Company"
    fill_in :company_name, with: "Super Strongs"
    # fill_in "Photo url", with: "http://www.example.com"
    click_button "Create Company"
    expect(page).to have_content "Super Strongs"
  end

  it "allows the User to edit the Company profile" do
    user.companies << company
    company.admin = user
    company.save

    login(user)
    click_link "#{user.first_name}'s Profile"
    click_link company.name
    expect(page).to have_content "#{company.name}"

    click_link "edit"
    fill_in :company_name, with: "New Company"
    click_button "Update Profile"
    expect(page).to have_content "New Company"
  end
  
end