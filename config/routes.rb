# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :services do
        get 'search', action: :search
      end

      resources :salons do
          put 'reminder', to: 'salons#update_reminder' 
          resources :salons_social_networks
      end

      resources :users do
        get 'search', action: :search
      end

      put 'users/:id/go_to_vacation', to: 'users#go_to_vacation'
      put 'users/:id/ban', to: 'users#ban'
      put 'users/:id/fire', to: 'users#fire'

      resources :clients

      resources :visits do
        get 'search', action: :search
      end
      put 'visits/:id/approve', to: 'visits#approve'
      put 'visits/:id/reject_by_user', to: 'visits#reject_by_user'
      put 'visits/:id/reject_by_client', to: 'visits#reject_by_client'
      put 'visits/:id/finish', to: 'visits#finish'

      resources :categories, only: %i[index show create update destroy]
    end
  end
end
