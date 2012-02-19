class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
        
    if user.admin? # User is an admin
      can :manage, :all
    elsif user and user.user_kind and user.access_rights.any? # User has defined access rights
      can :read, :all
      cannot :read, [AccessRight, UserKind, User, SuperAdminTable]
      for access_right in user.access_rights      
        if ((user.user_kind.leader? or user.user_kind.worker?) and (access_right.models_class_name == Answer)) #Answers can only be given by proper institution
          can access_right.rights_sym, access_right.models_class_name, :institution_id => user.institution_id
        else #assign given access right to given model
          can access_right.rights_sym, access_right.models_class_name
        end
      end
    else # User is a visitor
      can :read, :all
      can :create, OriginalPost
      cannot :destroy, :all
      cannot :read, [OriginalPost, AccessRight, UserKind, User, SuperAdminTable]
      cannot :manage, AccessRight
      cannot :manage, UserKind
      cannot :manage, User
    end
    
  end
end
