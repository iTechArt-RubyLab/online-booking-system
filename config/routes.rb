# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :salons
      resources :users
      resources :visits
      resources :categories, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
