require 'spec_helper'

describe "a user should be able to sign up for an account" do

  it "lets a user sign up" do
    visit root_path
    click_link "Join Dance Share!"
    fill_in "First name", with: "j"
    fill_in "Last name", with: "h"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    fill_in "Email", with: "j@ex.co"
    fill_in "Dob", with:"01/01/2011"
    choose 'user_gender_male'
    
    click_button "Create User"

    expect(page).to have_content "j h's Profile"
  end

end