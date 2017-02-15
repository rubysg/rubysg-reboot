Rails.application.routes.draw do
  root 'application#index'

  resources :companies, only: [:index]
  resources :invitations, only: [:create]
end
