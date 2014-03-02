require 'spec_helper'

describe Company do
  it { should belong_to(:admin).class_name('User').with_foreign_key('user_id') }
  it { should have_many(:users).through(:artists) }
  it { should have_many(:runs) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end