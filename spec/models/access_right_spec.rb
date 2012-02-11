require 'spec_helper'

describe AccessRight do
  subject { Factory :access_right }
  
  it { should be_valid }  
  
  it "should return these proper rights" do
    AccessRight.all_rights.sort_by {|hash| hash[:title] }.should == [
      {:value=>[:destroy, Answer], :title=>"Odgovori - Brisanje"},
      {:value=>[:create,  Answer], :title=>"Odgovori - Ustvarjanje"},
      {:value=>[:update,  Answer], :title=>"Odgovori - Urejanje"},
      {:value=>[:manage,  Answer], :title=>"Odgovori - Upravljanje"},

      {:value=>[:destroy, Event], :title=>"Dogodki - Brisanje"},
      {:value=>[:create,  Event], :title=>"Dogodki - Ustvarjanje"},
      {:value=>[:update,  Event], :title=>"Dogodki - Urejanje"},
      {:value=>[:manage,  Event], :title=>"Dogodki - Upravljanje"},

      {:value=>[:destroy, Post], :title=>"Objava - Brisanje"},
      {:value=>[:create,  Post], :title=>"Objava - Ustvarjanje"},
      {:value=>[:update,  Post], :title=>"Objava - Urejanje"},
      {:value=>[:manage,  Post], :title=>"Objava - Upravljanje"},

      {:value=>[:destroy, Photo], :title=>"Fotografije - Brisanje"},
      {:value=>[:create,  Photo], :title=>"Fotografije - Ustvarjanje"},
      {:value=>[:manage,  Photo], :title=>"Fotografije - Upravljanje"},

      {:value=>[:destroy, Institution], :title=>"Ustanove - Brisanje"},
      {:value=>[:create,  Institution], :title=>"Ustanove - Ustvarjanje"},
      {:value=>[:update,  Institution], :title=>"Ustanove - Urejanje"},
      {:value=>[:manage,  Institution], :title=>"Ustanove - Upravljanje"},

      {:value=>[:destroy, Tag], :title=>"Oznake - Brisanje"},
      {:value=>[:create,  Tag], :title=>"Oznake - Ustvarjanje"},
      {:value=>[:update,  Tag], :title=>"Oznake - Urejanje"},
      {:value=>[:manage,  Tag], :title=>"Oznake - Upravljanje"},

      {:value=>[:destroy, TagGroup], :title=>"Vrsta oznake - Brisanje"},
      {:value=>[:create,  TagGroup], :title=>"Vrsta oznake - Ustvarjanje"},
      {:value=>[:update,  TagGroup], :title=>"Vrsta oznake - Urejanje"},
      {:value=>[:manage,  TagGroup], :title=>"Vrsta oznake - Upravljanje"}
    ].sort_by {|hash| hash[:title] }
    
  end
    
  it "should reject value properties, that are not in the preset rights array" do
    access_right = AccessRight.new
    access_right.user_kind_right = { :title => "Krneki", :value => [:abalbala, Event] }
    access_right.save
    access_right.should_not be_valid 
  end
  
  it "should reject value properties, that are not in the preset rights array" do
    access_right = AccessRight.new
    access_right.user_kind_right = { :title => "Krneki", :value => [:manage, User] }
    access_right.save
    access_right.should_not be_valid 
  end
  
  it "should return a user_kind_right hash" do
    subject.user_kind_right.should == { :title=>"Dogodki - Upravljanje", :value => [:manage, Event]  }
  end
  
end
