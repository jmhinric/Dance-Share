require 'spec_helper'

describe Piece do
  it { should validate_presence_of(:choreographer) }
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:choreographer).scoped_to(:title) }
end