class ContactsController < InheritedResources::Base
  load_and_authorize_resource

  def new
    @contact = Contact.new
    @contact.institution = institution
  end

  def create
    create! { contacts_path }
  end
  
  def update
    update! { contacts_path }
  end

  def destroy
    destroy! { contacts_path }
  end

  def institution
    @institution ||= Institution.find(params[:institution_id]) if params[:institution_id].present?
  end
  
end