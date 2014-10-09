Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :bookmarks

  get 'home/index'

  root to: 'home#index'
end
