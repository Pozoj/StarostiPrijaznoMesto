Starci::Application.routes.draw do

  resources :statistics_tables
  resources :help_pages

  devise_for  :users, :path => "admins", :controllers => { :sessions => "sessions" }
  #devise_for  :help_pages, :path => "help", :controllers => { :sessions => "sessions" }
  resources   :access_rights,   :except => [:index, :show, :edit]
  resources :contacts,  :except => [:index, :show]
  
  match 'super_admin_tables' => 'super_admin_tables#index', :via => :get
  match 'statistics_tables' => 'statistics_tables#index', :via => :get
  match 'help' => 'help_pages#home', :via => :get

  resources   :abouts, :contacts, :conditions, :project_infos, :red_buttons, :except => [:show]
  resources   :answers, :cities, :events, :original_posts, :regions, :users, :user_kinds
  
  resources :institutions do
    resources :attachments, :only => [:new, :create, :destroy]
    resources :work_hours,  :exept => [:index, :destroy]
  end
  
  resources :attachments, :only => [:destroy]
  
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
