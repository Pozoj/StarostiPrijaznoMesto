class HomeController < ApplicationController
  skip_authorization_check :only => :index
  def index
    @institutions = Institution.all #TODO:select for juristiction
    @show_institution = Institution.find_by_id(params[:show_institution])
  end

end
