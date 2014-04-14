StackOverflowClone::Application.routes.draw do
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'

  resources :users
  resources :sessions

  root :to => 'users#index'
end
