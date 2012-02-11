require 'spec_helper'

describe TagGroup do
  subject { Factory :tag_group }
  
  describe "associations" do
    it { should have_many :tags }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
  
end
