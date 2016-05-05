Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  mount RuCaptcha::Engine => "/rucaptcha"

  root 'welcomes#index'

  devise_for :users

  resources :users, only: [:show] do
    member { get 'comments' }
    resource :account, only: [:edit, :update]
    namespace :collections do
      resources :videos, only: [:index]
      resources :articles, only: [:index]
    end
  end
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
    resources :articles, only: [:index, :new, :edit, :create, :update]
    resources :videos, only: [:index, :new, :create, :update, :edit]
    resources :banners, only: [:index, :new, :create, :update]
    namespace :gallery do
      resources :fixed_wings, :gliders, :helicopters, :fpvs, only: [:index, :new, :create, :update]
    end
    resources :battle_planes, only: [:index, :update, :new, :create]
    resources :users, only: [:index]
  end

  namespace :ajax do
    resources :videos, only: [:destroy, :update] do
      resources :collections, only: [:create]
    end
    resources :articles, only: [:destroy] do
      resources :collections, only: [:create]
    end
    resources :pictures, only: [:destroy]
    resources :battle_planes, only: [:update, :destroy]
    resources :comments, only: [:destroy]
    resources :users, only: [:update]
  end

end
