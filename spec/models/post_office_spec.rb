require 'spec_helper'

describe PostOffice do
  subject { Factory :post_office }
  
  describe "associations" do
    it { should have_many(:institutions) }
    it { should have_many(:events) }
  end

  describe "validations" do
    it { should be_valid }
  end
  
end
