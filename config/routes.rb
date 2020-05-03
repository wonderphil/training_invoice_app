Rails.application.routes.draw do
  devise_for :users
  
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :v1, defaults: { format: :json } do
    resources :contacts
    resource :sessions, only: [:create, :destroy]
    resources :users, only: [:create]
  end
end
