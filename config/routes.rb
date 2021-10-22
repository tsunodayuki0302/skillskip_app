Rails.application.routes.draw do
  devise_for :users
  root to: "recruitments#index"
  resources :users
  resources :recruitments do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
      get 'post_done'
      get 'delete_done'
      get 'detail_search'
      get 'update_done'
    end
  end
end
