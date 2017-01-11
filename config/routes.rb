Rails.application.routes.draw do
  apipie
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: "rails_admin/main#dashboard"

  namespace :api, defaults:{ format: :json } do
    namespace :v1 do
      resources :companies, only: [:index, :show, :create, :update, :destroy] do
        resources :employees, only: [:index, :show, :create, :update, :destroy]
      end
      #resources :employees, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
