class ProjectInfosController < InheritedResources::Base
  load_and_authorize_resource
  
  def create
    create! { project_infos_path }
  end
  
  def update
    update! { project_infos_path }
  end
  
  
end