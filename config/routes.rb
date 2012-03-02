Starci::Application.routes.draw do
  devise_for  :users, :path => "admins", :controllers => { :sessions => "sessions" }
  resources   :access_rights,   :except => [:index, :show, :edit]
  
  match 'super_admin_tables' => 'super_admin_tables#index', :via => :get
  
  resources   :abouts, :contacts, :conditions, :project_infos, :red_buttons, :except => [:show]
  resources   :answers, :cities, :events, :institutions, :original_posts, :regions, :users, :user_kinds
  
  resources :posts, :except => :index do
    collection do
      get :questions
      get :suggestions
      get :comments
      get :unapproved
      get :unaddressed
      get :addressed
      get :misplaced
      get :answered
      get :waiting
    end
  end
  
  root :to => 'home#index'
end
