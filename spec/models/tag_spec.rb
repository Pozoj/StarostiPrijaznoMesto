require 'spec_helper'

describe Tag do
  subject { Factory :tag }
  
  describe "associations" do    
    it { should have_and_belong_to_many(:posts) }
    it { should belong_to(:tag_group) }
  end

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :tag }
  end
  
end
