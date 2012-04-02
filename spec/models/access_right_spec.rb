require 'spec_helper'

describe AccessRight do
  subject { Factory :access_right }
  
  it { should be_valid }  
  
  it "should return these proper rights" do
    AccessRight.all_rights.sort_by {|hash| hash[:title] }.should == [
      {:value=>[:read,  OriginalPost], :title=>"Vidi - Neobdelane pobude"},
      {:value=>[:read,  UnaddressedPost], :title=>"Vidi - Nenaslovljene pobude"},
      {:value=>[:read,  Institutionalized], :title=>"Vidi - Naslovljene pobude"},
      {:value=>[:read,  SuperAdminTable], :title=>"Vidi - Administratorsko tabelo"},
      {:value=>[:read,  Waiting], :title=>"Vidi - Pobude v čakanju"},
      {:value=>[:read,  Answered], :title=>"Vidi - Odgovorjene pobude"},
      {:value=>[:read,  Misplaced], :title=>"Vidi - Napačno posredovane pobude"},

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

      {:value=>[:destroy, Attachment], :title=>"Fotografije - Brisanje"},
      {:value=>[:create,  Attachment], :title=>"Fotografije - Ustvarjanje"},
      {:value=>[:manage,  Attachment], :title=>"Fotografije - Upravljanje"},

      {:value=>[:destroy, Institution], :title=>"Ustanove - Brisanje"},
      {:value=>[:create,  Institution], :title=>"Ustanove - Ustvarjanje"},
      {:value=>[:update,  Institution], :title=>"Ustanove - Urejanje"},
      {:value=>[:manage,  Institution], :title=>"Ustanove - Upravljanje"}
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
