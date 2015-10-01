Rails.application.routes.draw do
  root 'application#index'
  get  :companies, to: 'application#companies'

  resources :invitations, only: [:create]
end
