Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resources :users, only: [:index, :update]

  namespace :ajax do
    resources :emails, only: [:index]
  end

end
