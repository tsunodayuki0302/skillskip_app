Rails.application.routes.draw do
  devise_for :users
  root to: "recruitments#index"
  resources :users
  resources :recruitments
end
