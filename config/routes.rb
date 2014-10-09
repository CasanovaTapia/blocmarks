Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :bookmarks do
    resources :likes, only: [:create, :destroy]
  end

  get 'home/index'

  root to: 'home#index'
end
