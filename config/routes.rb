# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root 'items#index'
  resources :items, only: %i[show]
  resources :order_items, only: %i[create update destroy]
  resource :cart, only: %i[show]

  devise_for :users

  namespace 'administration' do
    get '/', to: 'static_pages#hello_admin'
    resources :items
  end
end
