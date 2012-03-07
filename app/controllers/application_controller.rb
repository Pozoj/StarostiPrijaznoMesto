class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :body_attrs, :admin?, :klass_sort_column, :sort_direction
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :count_for_user_kind
  
  # Cancan
  check_authorization
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :error => exception.message
  end
    
  protected
  def admin?
    current_user and current_user.admin
  end
      
  def body_attrs
    klass = controller_name
    klass += " signed_out" unless current_user
    @body_attrs = {:id => "#{controller_name}-#{action_name}", :class => klass}
  end
  
  def export_i18n_messages
    SimplesIdeias::I18n.export! if Rails.env.development?
  end
  
  def count_for_user_kind
    #TODO glede na vrsto uporabnika moras nalozit counterje
    #ce ima uporabnik vezano ustanovo, mora prikazat addressed in waiting s countom za njihovo ustanovo
    # in sicer, ce gre za tako vrsto uporabnika, kjer bi to moralo bit omejeno. (worker, director)
    if user_signed_in?
      @unaddressed_count = UnaddressedPost.count if can? :read, UnaddressedPost
      @misplaced_count = Misplaced.count if can? :read, Misplaced
      @original_count = OriginalPost.untreated.count if can? :read, OriginalPost
      if current_user.user_kind.present? and current_user.institution_id.present? and current_user.user_kind.institution_admin?
        @addressed_count = Institutionalized.for_institution(current_user.institution_id).count if can? :read, Institutionalized
        @waiting_count = Waiting.for_institution(current_user.institution_id).count if can? :read, Waiting
      else
        @addressed_count = Institutionalized.count if can? :read, Institutionalized
        @waiting_count = Waiting.count if can? :read, Waiting  
      end
    end
  end

  def klass_sort_column(klass)
    (klass.column_names).include?(params[:sort]) ? params[:sort] : "original_posts_created_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end 
end
