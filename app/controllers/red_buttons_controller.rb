class RedButtonsController < InheritedResources::Base
  load_and_authorize_resource
  
  def create
    create! { red_buttons_path }
  end
  
  def update
    update! { red_buttons_path }
  end
  
end