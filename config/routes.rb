Rails.application.routes.draw do
  devise_for :users

  namespace :ajax do
    resources :emails, only: [:index]
  end

end
