Rails.application.routes.draw do    

  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores => (GET, POST, PUT, DELETE)
    resources :subjects # Áreas/Assuntos => (GET, POST, PUT, DELETE)
    resources :questions # Questões => (GET, POST, PUT, DELETE)
  end
  
  
  namespace :site do
    # localhost:3000/site/welcome/index => GET
    get  'welcome/index'
    # localhost:3000/site/search => GET
    get  'search', to: 'search#questions'
    # localhost:3000/site/subject/:subject_id/:subject => GET
    get  'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    # localhost:3000/site/answer => POST
    post 'answer', to: 'answer#question'
  end

  
  namespace :users_backoffice do
    # localhost:3000/users_backoffice/welcome/index => GET
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    # localhost:3000/admins_backoffice/welcome/index => GET
    get 'welcome/index'
  end
  
  devise_for :admins
  devise_for :users
  
  #localhost:3000/inicio => GET
  get 'inicio', to: 'site/welcome#index'
  
  #localhost:3000/ => GET
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
