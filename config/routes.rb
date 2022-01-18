# frozen_string_literal: true

Rails.application.routes.draw do
  get 'services/index'
  namespace :api do
    namespace :v1 do
      resources :services
    end
  end
end
