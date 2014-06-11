require 'spec_helper'

describe "user can view a single video" do
  let!(:video) { FactoryGirl.create(:video) }

  it "lets a user view a video" do

    visit video_path(video)

    expect(page).to have_content video.title
    expect(page).to have_content video.author

  end
end