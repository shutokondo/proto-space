Rails.application.routes.draw do
  devise_for :users
  root "prototypes#index"
  namespace :prototypes do
    resources :comments, only: [:create]
    resources :popular, only: [:index]
    resources :newest, only: [:index]
  end

  resources :prototypes
  resources :users, only: [:show, :edit, :update]
  resources :likes, only: [:create, :update]
  resources :tags, only: [:index, :show]
end
