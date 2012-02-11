require 'spec_helper'

describe Region do
  subject { Factory :region }
  
  describe "associations" do
    it { should have_many(:cities) }
  end

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
