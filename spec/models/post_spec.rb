require 'spec_helper'

describe "Approved Post", :class => "Post" do
  subject { Factory :post }
  
  describe "associations" do
    it { should belong_to :original_post }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :title }
    it { should validate_presence_of :summary }
    it { should validate_presence_of :text }
    it { should validate_presence_of :post_kind_id }
    it { should validate_presence_of :post_status_id }
    it { should validate_presence_of :sex_id }      
    it { should validate_presence_of :tag_group_id }
  end

end

describe "Rejected Post", :class => "Post" do
  subject { Factory :rejected_post }
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :post_status_id }
    it { should_not validate_presence_of :title }
    it { should_not validate_presence_of :summary }
    it { should_not validate_presence_of :text }
    it { should_not validate_presence_of :post_kind_id }
    it { should_not validate_presence_of :sex_id }      
    it { should_not validate_presence_of :tag_group_id }
    
  end
end
