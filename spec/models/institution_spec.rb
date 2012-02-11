require 'spec_helper'

describe Institution do
  subject { Factory :institution }
  
  describe "associations" do
    it { should belong_to(:post_office) }
    it { should have_many(:users) }
    it { should have_many(:events) }
  end  

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :address }
  end
  
end
