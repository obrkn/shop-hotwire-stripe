Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  post 'pages/add', to: 'pages#add'
  get 'pages/cart', to: 'pages#cart'
end
