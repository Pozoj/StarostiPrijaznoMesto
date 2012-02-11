require 'spec_helper'

describe City do
  subject { Factory :city }
  
  describe "associations" do
    it { should belong_to(:region) }
    it { should have_many(:original_posts) }
    it { should have_and_belong_to_many(:institutions) }
  end

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
  
end
