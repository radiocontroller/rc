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
  resources :admin, only: [:index]

  namespace :upload do
    resources :images, only: [:create]
  end

  namespace :admin do
    resources :articles, only: [:new, :create]
    resources :videos, only: [:index, :new, :create, :update] do
      collection do
        get 'homepage'
      end
    end
    resources :banners, only: [:index, :new, :create, :update]
    namespace :gallery do
      resources :fixed_wings, only: [:index, :new, :create, :update]
      resources :gliders, only: [:index, :new, :create, :update]
      resources :helicopters, only: [:index, :new, :create, :update]
      resources :fpvs, only: [:index, :new, :create, :update]
    end
  end

  namespace :ajax do
    resources :videos, only: [:destroy, :update]
    resources :pictures, only: [:destroy]
  end

end
