# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'items#index'
  get "items/:id", to: "items#show", as: "item"

  devise_for :users
  root 'static_pages#hello'

  namespace 'administration' do
    get '/', to: 'static_pages#hello_admin'
  end
end
