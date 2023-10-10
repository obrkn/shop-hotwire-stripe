Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'pages/add', to: 'pages#add'
end
