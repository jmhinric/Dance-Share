require 'spec_helper'
require 'login_helper'

describe "a user should be able to manage their account" do
  let(:user) { FactoryGirl.create(:user) }

  it "lets a user log in" do
    visit root_path
    click_link "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content user.first_name
  end

  it "lets a user log out" do
    login(user)
    click_link "Log Out"
    expect(page).to have_content "Log In"
    visit edit_user_path(user)
    expect(page).to have_content "Please Log In"
  end

  it "lets a user edit their profile" do
    login(user)
    click_link "edit"
    expect(page).to have_content "Edit #{user.first_name}'s Profile"

    fill_in "First name", with: "Josie"
    click_button "Update User"
    expect(page).to have_content "Josie"
  end

  it "lets a user delete their profile" do
    login(user)
    click_link "edit"
    click_link "Delete Profile"
    expect(page).to have_content "Profile successfully deleted!"
  end
end

describe "users need authentication" do
  let(:user) { FactoryGirl.create(:user) }

  it "needs authentication to edit the profile" do
    visit edit_user_path(user)
    expect(page).to have_content "Please Log In"
  end
end

describe "users need authorization", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:non_user) { FactoryGirl.create(:user) }

  it "needs authorization to visit the edit profile page" do
    login(non_user)
    visit edit_user_path(user)
    expect(page).to have_content "Authorization failed"
  end

  # it "needs authorization for the update action" do
  #   login(non_user)
  #   before { patch user_path(user) }
  #   specify { expect(response).to have_content "Authorization failed" }
  # end
end