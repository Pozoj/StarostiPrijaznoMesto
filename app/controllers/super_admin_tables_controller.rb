class SuperAdminTablesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @table = SuperAdminTable.order(sort_column + " " + sort_direction)
    authorize! :show, @table
  end
  
  
  private
  
  def sort_column
    (SuperAdminTable.column_names).include?(params[:sort]) ? params[:sort] : "original_post_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
  
end