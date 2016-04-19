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
    resources :comments, only: [:create]
  end
  resources :articles, only: [:index, :show] do
    resources :comments, only: [:create]
  end
  resources :admin, only: [:index]

  namespace :upload do
    resources :pictures, only: [:create]
  end

  namespace :admin do
    resources :articles, only: [:new, :create]
    resources :videos, only: [:index, :new, :create, :update] do
      collection { get 'homepage' }
    end
    resources :banners, only: [:index, :new, :create, :update]
    namespace :gallery do
      resources :fixed_wings, only: [:index, :new, :create, :update]
      resources :gliders, only: [:index, :new, :create, :update]
      resources :helicopters, only: [:index, :new, :create, :update]
      resources :fpvs, only: [:index, :new, :create, :update]
    end
    resources :battle_planes, only: [:index, :update, :new, :create]
  end

  namespace :ajax do
    resources :videos, only: [:destroy, :update] do
      resources :collections, only: [:create]
    end
    resources :articles, only: [:index] do
      resources :collections, only: [:create]
    end
    resources :pictures, only: [:destroy]
    resources :battle_planes, only: [:update]
    resources :comments, only: [:destroy]
  end

end
