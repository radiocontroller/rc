Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount RuCaptcha::Engine => "/rucaptcha"

  root 'welcomes#index'

  devise_for :users

  resources :welcomes, only: [:index]
  resources :videos, only: [:index, :show] do
    collection do
      get 'fixed_wing', 'glider', 'helicopter', 'fpv'
    end
  end
  resources :articles, only: [:index]
  resources :pictures

  resources :admin, only: [:index]

  namespace :admin do
    resources :videos, only: [:index, :new, :create, :update]
    resources :banners, only: [:index, :new, :create, :update]
  end

  namespace :ajax do
    resources :videos, only: [:destroy]
  end

end
