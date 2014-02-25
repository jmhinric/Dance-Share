require 'spec_helper'

describe "a user should be able to log in" do
  let(:user) { FactoryGirl.create(:user) }

  it "lets a user log in" do
    visit root_path
    click_link "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_content user.first_name
  end
end