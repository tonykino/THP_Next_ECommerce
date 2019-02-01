# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'orders/show', to: 'orders#show'
  # get 'orders/index', to: 'orders#index'

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'items#index'
  resources :items, only: %i[show]
  resources :order_items, only: %i[create update destroy]
  resource :cart, only: %i[show]
  resources :orders, only: %i[index show]
  devise_for :users
  resources :charges

  namespace 'administration' do
    get '/', to: 'static_pages#hello_admin'
    resources :items
    resources :orders, only: %i[index show create]
  end
end
