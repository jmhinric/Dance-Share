require 'spec_helper'

describe Video do
  it { should belong_to(:user) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:sub_category) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:video_id) }

end