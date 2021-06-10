Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, except: [:destroy]
  resource :session, only: [:destroy, :create, :new]
  resources :questions, except: [:index, :new, :show]
  resources :hashtags, only: [:show], param: :name
end
