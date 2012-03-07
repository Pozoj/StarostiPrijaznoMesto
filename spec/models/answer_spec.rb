require 'spec_helper'

describe "Misplaced Answer", :class => "Answer" do
  subject { Factory :misplaced_answer }
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :institution_id }
    it { should validate_presence_of :user_id }
  end
  
  it "on save should set misplaced_at" do
    answer = Factory.build :misplaced_answer
    answer.save
    answer.answer_status.should == "misplaced"
    answer.misplaced_at.present?.should == true
  end
  
  it "should archive previously misplaced answer when a new answer is institutionalized" do
    #answer has been sent to wrong institution
    misplaced = Factory :misplaced_answer
    post = misplaced.post
    
    #a new institution has been asigned to post
    institutionalized = Factory.build :institutionalized_answer, :post_id => post.id
    
    #on institutionalized.save should set status to previously misplaced answer to archive
    institutionalized.save
    
    #answers for post should now contain an archived answer and a institutionalized answer
    current_statuses = post.answers.map(&:answer_status)
    current_statuses.include?("archive").should == true
    current_statuses.include?("institutionalized").should == true
    post.answers.count.should == 2
    post.answers.misplaced.present?.should == false
  end
  
end

describe "Institutionalized Answer", :class => "Answer" do
  subject { Factory :institutionalized_answer }
  
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
    it { should belong_to(:institution) }
  end
  
  describe "validations" do
    it {
      institutionalized = Factory.build :institutionalized_answer
      institutionalized.save
      #before it's validated, the answer_status is set to 'institutionalized' and it's saved, 
      #but in case of editing answer (or answering) we want the answer to be 
      #verified according to answer status, therefore it's cleared if the stored
      #answer has an institutionalized answer status
      institutionalized.should have(1).error_on(:answer_status)
    }
      
      
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :institution_id }
    it { should validate_presence_of :answer_status }
    
    it "on creation should set answer_status and institutionalized_at" do
      institutionalized = Factory.build :institutionalized_answer
      institutionalized.save
      institutionalized.answer_status.should == "institutionalized"
      institutionalized.institutionalized_at.present?.should == true
    end
  end
end

describe "Answered Answer", :class => "Answer" do
  subject { Factory :answered_answer }
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :institution_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :answer }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :answer_range }
    it { should validate_presence_of :answer_status }    
  end
  
  it "on save should set answered_at" do
    answer = Factory.build :answered_answer
    answer.save
    answer.answer_status.should == "answered"
    answer.answered_at.present?.should == true
  end
end

describe "Waiting Answer", :class => "Answer" do
  subject { Factory :waiting_answer }
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :post_id }
    it { should validate_presence_of :institution_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :answer }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :answer_range }
    it { should validate_presence_of :answer_status }    
  end
  
  it "on save should set waiting_at" do
    answer = Factory.build :waiting_answer
    answer.save
    answer.answer_status.should == "waiting"
    answer.waiting_at.present?.should == true
  end
  
end


