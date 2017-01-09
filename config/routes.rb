Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      resources :companies, only: [:index, :show, :create, :update, :destroy] do
        resources :employees, only: [:index, :show, :create, :update, :destroy]
      end
      resources :employees, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
