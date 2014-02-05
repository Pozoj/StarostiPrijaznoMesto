# Encoding: utf-8
class HelpPagesController < ApplicationController
  #load_and_authorize_resource
  skip_authorization_check
  skip_load_resource :only => [:home]
  skip_before_filter :authenticate_user!, :only => [:home]

end
