StackOverflowClone::Application.routes.draw do
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: 'sessions#new', as: 'login'
  get 'signup', to: 'users#new', as: 'signup'

  resources :users do
    resources :questions, :except => [:index, :show]
  end

  resources :sessions
  resources :questions, :only => [:index, :show]

  root :to => 'users#index'
end
