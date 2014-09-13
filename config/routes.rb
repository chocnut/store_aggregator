Rails.application.routes.draw do
  root to: 'home_page#index'

  resources :searches, only: [:create, :show]
end
