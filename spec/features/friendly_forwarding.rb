require 'spec_helper'

describe "FriendlyForwardings" do
  let!(:user) { FactoryGirl.create(:user) }

  it "should forward to the requested page after signin" do
    visit edit_user_path(user)
    
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button "Log in"
    
    expect(page).to have_content "Edit"
  end
end