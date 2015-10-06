Rails.application.routes.draw do
  devise_for :users
  root "prototypes#index"
  resources :users
  resources :prototypes
  resources :likes
  resources :comments
  resources :tags
  resources :popular
  resources :newest
end
