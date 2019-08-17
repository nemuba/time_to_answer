Rails.application.routes.draw do    
 
  # localhost:3000/admins_backoffice/(admins,subjects,questions)
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard => method: GET
    resources :admins # Administradores => methods: (GET, POST, PUT, DELETE)
    resources :subjects # Áreas/Assuntos => methods: (GET, POST, PUT, DELETE)
    resources :questions # Questões => methods: (GET, POST, PUT, DELETE)
  end
  
  # localhost:3000/site/(welcome, search, subject, answer)
  namespace :site do
    # localhost:3000/site/welcome/index => method: GET
    get  'welcome/index'
    # localhost:3000/site/search => method: GET
    get  'search', to: 'search#questions'
    # localhost:3000/site/subject/:subject_id/:subject => method: GET
    get  'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    # localhost:3000/site/answer => method: POST
    post 'answer', to: 'answer#question'
  end

  # localhost:3000/users_backoffice/(welcome)
  namespace :users_backoffice do
    # localhost:3000/users_backoffice/welcome/index => method: GET
    get 'welcome/index'
    # localhost:3000/users_backoffice/profile => method: GET
    get 'profile', to: 'profile#edit'
    
    patch 'profile/:id', to: 'profile#update'
  end
  
  devise_for :admins, skip: [:registrations]
  devise_for :users
  
  # localhost:3000/inicio => method: GET
  get 'inicio', to: 'site/welcome#index'
  
  # localhost:3000/ => method: GET
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
