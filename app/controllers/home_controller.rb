class HomeController < ApplicationController
  skip_authorization_check :only => :index
  def index
    #@institutions = Institution.all #TODO:select juristiction
    @institutions = Institution.visible
    @show_institution = Institution.find_by_id(params[:show_institution])
    @posts = HomescreenPost.desc.page(params[:page])
    @events = Event.till_end_of_month.order("date_and_time_at ASC")
  end

end
