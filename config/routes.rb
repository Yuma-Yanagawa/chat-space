Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'messages#index'
  resources :groups, only: [:new, :create, :edit, :update]
end
