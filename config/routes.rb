# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :salons, only: [:index, :show, :create, :destroy, :update]
    end
  end
end
