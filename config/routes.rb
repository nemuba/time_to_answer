Rails.application.routes.draw do

  # localhost:3000/admins_backoffice/welcome/index
  # localhost:3000/admins_backoffice/admins  GET
  # localhost:3000/admins_backoffice/admins  POST
  # localhost:3000/admins_backoffice/admins/new GET
  # localhost:3000/admins_backoffice/admins/:id/edit PUTCH
  namespace :admins_backoffice do
    get 'welcome/index' # Dashboard
    resources :admins # Administradores
    resources :subjects # Áreas/Assuntos
    resources :questions # Questões
  end
  
  # localhost:3000/site/welcome/index
  namespace :site do
    get 'welcome/index'
  end

  # localhost:3000/users_backoffice/welcome/index
  namespace :users_backoffice do
    get 'welcome/index'
  end

  # localhost:3000/admins_backoffice/welcome/index
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  
  devise_for :admins
  devise_for :users
  
  #localhost:3000/inicio
  get 'inicio', to: 'site/welcome#index'
  
  #localhost:3000/
  root to: 'site/welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
