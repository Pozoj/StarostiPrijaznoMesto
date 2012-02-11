class EventsController < InheritedResources::Base
  load_and_authorize_resource
    
  def new
    @event = Event.new
    @event.user_id = current_user.id
    @event.institution_id = current_user.institution.present?? current_user.institution_id : nil
  end
  
  protected
  
  def collection
    if params[:year].present? and params[:month].present?
      @cal_date = Date.new(params[:year].to_i, params[:month].to_i, 1)
    else
      @cal_date = Date.today
    end
    
    Event.on_month(@cal_date)
  end
  
end
