require 'spec_helper'

describe Venue do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:yelp_id) }
  it { should validate_presence_of(:rating_image_url) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:display_address) }
  it { should validate_presence_of(:review_count) }

  it { should validate_uniqueness_of(:yelp_id) }

  it { should have_many(:runs) }

end