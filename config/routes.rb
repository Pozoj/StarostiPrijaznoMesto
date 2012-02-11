Starci::Application.routes.draw do
  devise_for  :users, :path => "admins", :controllers => { :sessions => "sessions" }
  resources   :access_rights,   :except => [:index, :show, :edit]
  
  match 'institutionalize_answer' => 'answers#institutionalize', :via => :get
  
  resources   :abouts, :contacts, :conditions, :original_posts, :project_infos, :red_buttons, :except => [:show]
  resources   :answers, :cities, :events, :institutions, :regions, :users, :user_kinds
  
  resources :posts, :except => :index do
    collection do
      get :unaddressed_questions
      get :addressed_questions
      get :answered_questions
      get :unapproved
      get :comments
      get :suggestions
      get :questions
    end
  end
  
  root :to => 'home#index'
end
