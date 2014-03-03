require 'spec_helper'
require 'login_helper'

describe "user creates a dance company" do
  let(:user) { FactoryGirl.create(:user) }


  it "allows a user to create a company" do
    login(user)
    
  end
  
end