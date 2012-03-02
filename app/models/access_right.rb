class AccessRight < ActiveRecord::Base
  validates_presence_of :user_kind_id, :name, :right
  validate :validate_selected_right

  RIGHTS = [
    "read",
    "manage",
    "create",
    "update",
    "destroy"
  ]
  
  MODELS = [
    'Answer',
    'Event',
    'Post',
    'Photo',
    'Institution',
    'Tag',
    'TagGroup',
    'SuperAdminTable',
    'UnaddressedPost',
    'Institutionalized',
    'Waiting',
    'Answered',
    'Misplaced'
  ]
    
  ALL_RIGHTS = [
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
    {:value=>[:manage,  Institution], :title=>"Ustanove - Upravljanje"},
  ]
  
  class << self
    #Returns an array of hashes representing every needed premeision on accessible classes
    # Returned hash looks like this:
    #   [ {:title => "Title", :value => { :right => right_key, :name => model_key} }, ..]
    #
    def all_rights 
      ALL_RIGHTS.sort_by {|hash| hash[:title] }
    end
    
  end # class << self
  
  
  def user_kind
    UserKind.find(user_kind_id)
  end
  
  def user_kind=(uk)
    self.user_kind_id = uk
  end
  
  def user_kind_right
    # { :title => to_s, :value => [ rights_sym, models_class_name ] }
    ALL_RIGHTS.find {|x| x[:value] == [rights_sym, models_class_name] } if (right and name)
  end
  
  def user_kind_right=(_user_kind_right)
    right_name, model_name = "", ""    
    selected_right_array = RIGHTS.reject {|r| _user_kind_right.index(r) != 0 }
    
    if selected_right_array.any?
      right_name = selected_right_array.first
      model_name = _user_kind_right.gsub(right_name, "")
    end
    
    if model_name.present?
      if MODELS.include? model_name
        self.right = right_name.to_s
        self.name = model_name.to_s
      end
    end
  end
  
  def to_s
    current_right = ALL_RIGHTS.find {|x| x[:value] == [rights_sym, models_class_name] } if (right and name)
    current_right[:title] if current_right.present?
  end
  
  def models_class_name
    name.classify.constantize if name
  end
  
  def rights_sym
    right.to_sym if right
  end

  private
  
  def validate_selected_right
    if self.name.nil? or self.right.nil?
      errors[:user_kind_right] = "Potrebno je izbrati pravico"
    else
      errors[:user_kind_right] = "Vrsti uporabnika ste že dodali izbrano pravico" if new_record? and AccessRight.find_by_user_kind_id_and_name_and_right(user_kind_id, name, right)
    end
  end  
end
