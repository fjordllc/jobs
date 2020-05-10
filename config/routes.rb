# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: %i[new create]
  resources :companies, only: %i[index show new create]
  resources :jobs
  get "/*id" => 'pages#show', as: :static_page, format: false

  namespace :admin do
    root to: 'home#index'
    resources :tokens, only: %i[new create]
    get 'sign_in/:token', to: 'sessions#create', as: :sign_in
    delete 'sign_out', to: 'sessions#destroy', as: :sign_out
    resources :users, only: %i[index]
    resources :companies, only: %i[index]
  end

  namespace :company do
    resources :tokens, only: %i[new create]
    get 'sign_in/:token', to: 'sessions#create', as: :sign_in
    delete 'sign_out', to: 'sessions#destroy', as: :sign_out
  end

  namespace :user do
    resources :tokens, only: %i[new create]
    get 'sign_in/:token', to: 'sessions#create', as: :sign_in
    delete 'sign_out', to: 'sessions#destroy', as: :sign_out
  end

  if Rails.env.development?
    get 'easy_login', to: 'easy_login#show'
    get 'easy_login/login', to: 'easy_login#login'
    get 'easy_login/logout', to: 'easy_login#logout'
  end
end
