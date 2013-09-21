class InstitutionsController < InheritedResources::Base
  load_and_authorize_resource
  
  def show
    @posts = PublicPost.for_institution(params[:id])
    @contacts = Contact.where(:institution_id => params[:id])
    @created_at_title = "Prejem objave"
    @post_kind_title = "Naziv objave"
    show!
  end
end