Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'groups#index'
  resources :messages, only: [:index]
  resources :groups, only: [:index, :new, :create, :edit, :update]
  get 'groups/1/edit' => 'groups#edit'
end
