Rails.application.routes.draw do
  resources :users
  resources :books
  resources :notifications
  resources :user_books

  mount ActionCable.server => '/cable'
end
