Rails.application.routes.draw do
  root 'application#index'

  resources :companies, only: [:index]
  resources :invitations, only: [:create]
  resources :forms, param: :form_type, only: [:show, :create]

  namespace :api do
    post "ruby_sg_bot/webhook", to: "ruby_sg_bot#webhook"
  end
end
