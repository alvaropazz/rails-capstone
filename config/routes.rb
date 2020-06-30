Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users
  resources :groups
  resources :projects do
    collection do
      get :external
    end
  end

  resources :sessions, only: %i[create new destroy]
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
end
