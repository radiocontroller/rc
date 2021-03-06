Rails.application.routes.draw do
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount RuCaptcha::Engine => "/rucaptcha"

  root 'welcomes#index'

  devise_for :users

  resources :users, only: [:show] do
    member { get 'comments', 'replies' }
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
    resources :battle_planes, only: [:index, :update, :new, :create, :edit]
    resources :users, only: [:index]
    resources :access_logs, only: [:index]
  end

  namespace :ajax do
    resources :videos, only: [:destroy] do
      resources :collections, only: [:create]
    end
    resources :articles, only: [:destroy] do
      resources :collections, only: [:create]
    end
    resources :pictures, only: [:destroy]
    resources :battle_planes, only: [:destroy]
    resources :comments, only: [:destroy]
    resources :users, only: [:update] do
      member { put 'limit', 'release' }
    end
  end

end
