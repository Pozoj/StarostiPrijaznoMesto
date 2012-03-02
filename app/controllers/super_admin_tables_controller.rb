class SuperAdminTablesController < ApplicationController
  load_and_authorize_resource :only => :index
  
  helper_method :sort_column, :sort_direction
  
  def index
    if params[:posts_post_kind_id].present? and PostKind.keys.include?(params[:posts_post_kind_id])
      @table = SuperAdminTable.where(:posts_post_kind_id => params[:posts_post_kind_id]).order("original_posts_created_at desc")
    else
      @table = SuperAdminTable.order(sort_column + " " + sort_direction)
    end
  end
  
  private
  
  def sort_column
    (SuperAdminTable.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
  
end