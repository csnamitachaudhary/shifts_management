Rails.application.routes.draw do
  root :to => 'teams#index'

  resources :shifts do 
    member do
      get :delete
    end
  end
  resources :members do 
    member do
      get :delete
    end
  end
  resources :teams do
    member do
      get :delete
    end
  end
  resources :users
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
