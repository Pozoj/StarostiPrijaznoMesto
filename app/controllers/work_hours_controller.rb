class WorkHoursController < InheritedResources::Base
  load_and_authorize_resource
  belongs_to :institution

  def create
    create! { institution_path( parent ) }
  end
  
  def update
    update! { institution_path( parent ) }
  end
  
  def destroy
    destroy! { institution_path( parent ) }
  end
  
end
