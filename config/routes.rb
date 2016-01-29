Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  namespace :ajax do
    resources :emails, only: [:index]
  end

end
