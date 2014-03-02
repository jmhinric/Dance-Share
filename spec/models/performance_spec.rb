require 'spec_helper'

describe Performance do  
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:run_id) }

  it { should belong_to(:run) }
  it { should have_many(:reviews) }
end