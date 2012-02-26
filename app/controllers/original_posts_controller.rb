class OriginalPostsController < InheritedResources::Base
  load_and_authorize_resource
  skip_load_resource :only => [:new, :create]
  skip_before_filter :authenticate_user!, :only => [:new, :create]
  helper_method :sort_column, :sort_direction
  
  actions :all, :except => [ :show ]
  
  def new
    @original_post = OriginalPost.new
    @original_post.attachments.build
  end

  def create
    #raise env['REMOTE_ADDR']
    attachment_attributes = params["original_post"]["attachments_attributes"]["0"] if params["original_post"].present? and params["original_post"]["attachments_attributes"].present? and params["original_post"]["attachments_attributes"]["0"].present?
    if params["original_post"].present? and og_post = OriginalPost.create( params["original_post"].merge({:ip => env['REMOTE_ADDR'] }).delete_if {|k,v| k == "attachments_attributes"} )
      if attachment_attributes.present?
        attachment = Attachment.create({:holder_id => og_post.id, :holder_type => "OriginalPost"}.merge(attachment_attributes))
      end
      redirect_to root_path, :notice => "Uspešno ste oddali vprašanje. Hvala za Vaš prispevek."
    else
      render new_original_post_path, :alert => "Prišlo je do napake. Poskusite jih odpraviti."
    end
  end
  
  private
  
  def collection
    OriginalPost.untreated.order(sort_column + " " + sort_direction)
  end
  
  def sort_column
    (OriginalPost.column_names).include?(params[:sort]) ? params[:sort] : "created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
  
end
