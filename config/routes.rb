# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cart_items, only: %i[create index destroy]
  resources :payments, only: %i[new create]
end
