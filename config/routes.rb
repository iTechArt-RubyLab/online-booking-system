# frozen_string_literal: true

Rails.application.routes.draw do
  get 'services/index'
  namespace :api do
    namespace :v1 do
      resources :services
      resources :salons, only: [:index, :show, :create]
      resources :users
    end
  end
end
