require 'spec_helper'

describe Answer do
  subject { Factory :answer }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should belong_to(:institution) }
  end  

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :answer_status }
    
    #it { should validate_presence_of :answer }
    #it should validate things according to answer_status.. 
    #answer status == "answered" should validate presence of answer
  end
  
end
