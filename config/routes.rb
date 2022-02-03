# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :services
      resources :salons do
        put 'reminder', to: 'salons#update_reminder' 
        resources :salons_social_networks
    end
      resources :users do
        get 'search', action: :search
      end
      resources :clients
      resources :visits do
        get 'search', action: :search
      end
      resources :categories, only: %i[index show create update destroy]
    end
  end
end
