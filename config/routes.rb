# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :services
      resources :salons, only: [:index, :show, :create] do
        resources :salons_social_networks
      end
      resources :users
      resources :visits
    end
  end
end
