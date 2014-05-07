require 'spec_helper'

describe Run do
  # it { should validate_presence_of(:title) }

  it { should belong_to(:venue) }
  it { should belong_to(:company) }
  it { should have_many(:performances) }
end