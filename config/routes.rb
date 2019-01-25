# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  namespace :administration do
    get 'static_pages/hello_admin'
  end

  devise_for :users
  root 'static_pages#hello'

  namespace 'administration' do
    get '/', to: 'static_pages#hello_admin'
  end
end
