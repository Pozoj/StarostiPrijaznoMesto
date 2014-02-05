class ProjectInfosController < InheritedResources::Base
  #load_and_authorize_resource
  skip_authorization_check
  skip_load_resource :only => [:index]
  skip_before_filter :authenticate_user!, :only => [:index]
  
  def create
    create! { project_infos_path }
  end
  
  def update
    update! { project_infos_path }
  end
  
  
end