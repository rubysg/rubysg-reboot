Rails.application.routes.draw do
  root 'application#index'

  resources :invitations, only: [:create]
end
