# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :salons, only: [:index, :show, :create]
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
