require 'spec_helper'

describe Event do
  subject { Factory :event }
  
  describe "associations" do
    it { should belong_to(:institution) }
    it { should belong_to(:user) }
    it { should belong_to(:post_office) }
  end

  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :date_and_time_at }
    it { should validate_presence_of :address }
  end
  
end
