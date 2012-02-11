class OriginalPostsController < InheritedResources::Base
  load_and_authorize_resource
  skip_load_resource :only => [:new, :create]
  skip_before_filter :authenticate_user!, :only => [:new, :create]
  
  actions :all, :except => [ :show ]
  
  def new
    @original_post = OriginalPost.new
    @original_post.photos.build
  end

  def create
    #raise env['REMOTE_ADDR']
    photo_attributes = params["original_post"]["photos_attributes"]["0"] if params["original_post"].present? and params["original_post"]["photos_attributes"].present? and params["original_post"]["photos_attributes"]["0"].present?
    if params["original_post"].present? and og_post = OriginalPost.create( params["original_post"].merge({:ip => env['REMOTE_ADDR'] }).delete_if {|k,v| k == "photos_attributes"} )
      if photo_attributes.present?
        photo = Photo.create({:holder_id => og_post.id, :holder_type => "OriginalPost"}.merge(photo_attributes))
      end
      redirect_to root_path, :notice => "Uspešno ste oddali vprašanje. Hvala za Vaš prispevek."
    else
      render new_original_post_path, :alert => "Prišlo je do napake. Poskusite jih odpraviti."
    end
  end
  
  private
  
  def collection
    OriginalPost.untreated
  end
end
