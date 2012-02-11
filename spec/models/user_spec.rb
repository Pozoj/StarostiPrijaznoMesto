require 'spec_helper'

describe User do
  subject { Factory :user }
  
  describe "associations" do
    it { should belong_to(:institution) }
    it { should have_many(:answers) }
    it { should have_many(:events) }
  end
  
  describe "validations" do
    it { should be_valid }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    #it { should validate_format_of(:email).with( Configuration::EMAIL_CHECK ) }
  end  
  
  describe "access rights" do
    it "should return users access rights" do
      access_right = Factory :access_right
      subject.access_rights.first.should == access_right
    end

    it "should have given rights" do
      access_right = Factory :access_right
      Ability.new(subject).can?(:manage, Event).should == true
    end
  end
  
  describe "features" do
    it "should return name when to_s is called" do
      subject.to_s.should == "#{subject.first_name} #{subject.last_name}"
    end
  end
end
