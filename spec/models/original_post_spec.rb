require 'spec_helper'

describe OriginalPost do
  subject { Factory :original_post }
  
  describe "associations" do
    it { should have_many(:posts) }
  end
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :text }
  end
  
end
