class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    #Everyone can do this
    can :create, OriginalPost
    can :read, [About, Condition, Contact, Event, HomescreenPost, Institution, Post, PublicPost, RedButton]
    can [:questions, :comments, :suggestions, :waiting], Post
    
    if user.admin? # User is an admin
      can :manage, :all
    else #user is signed in with given rights or is a visitor
      cannot :read, [AccessRight, UserKind, User]
      if user and user.user_kind.present? and user.access_rights.any? # User has defined access rights
        for access_right in user.access_rights
          if user.user_kind.institution_admin? and (access_right.models_class_name == Answer or access_right.models_class_name == Event)
            #Answers can only be given by proper institution
            can access_right.rights_sym, access_right.models_class_name, :institution_id => user.institution_id
          else #assign given access right to given model
            can access_right.rights_sym, access_right.models_class_name
            #specific Post action
            can :addressed,   Post  if access_right.rights_sym == :read and access_right.models_class_name == Institutionalized
            can :unaddressed, Post  if access_right.rights_sym == :read and access_right.models_class_name == UnaddressedPost
            can :waiting,     Post  if access_right.rights_sym == :read and access_right.models_class_name == Waiting
            can :misplaced,   Post  if access_right.rights_sym == :read and access_right.models_class_name == Misplaced
            can :answered,    Post  if access_right.rights_sym == :read and access_right.models_class_name == Answered
            can :unapproved,  Post  if access_right.rights_sym == :read and access_right.models_class_name == RejectedPost
          end      
        end
      else # User is a visitor
        cannot :destroy, :all
        cannot :read, [OriginalPost, SuperAdminTable, Institutionalized, Waiting, Misplaced ]
        cannot :manage, AccessRight
        cannot :manage, UserKind
        cannot :manage, User
      end
    end
  end
end
