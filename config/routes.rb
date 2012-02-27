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
      get :unaddressed_questions
      get :unaddressed_comments
      get :unaddressed_suggestions
      get :addressed_questions
      get :addressed_comments
      get :addressed_suggestions 
      get :misplaced_questions
      get :misplaced_comments
      get :misplaced_suggestions

      get :answered_questions
      get :answered_comments
      get :answered_suggestions 

      get :waiting_questions
      get :waiting_comments
      get :waiting_suggestions 

      get :unapproved
    end
  end
  root :to => 'home#index'
end
