class InstitutionsController < InheritedResources::Base
  load_and_authorize_resource
  
  def show
    @posts = PublicPost.for_institution(params[:id])
    show!
  end
end