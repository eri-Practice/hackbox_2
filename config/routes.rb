Rails.application.routes.draw do
  root to: 'posts#index'
  
  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :posts do
    collection do
      get 'search'
      get 'category'
      get 'rank'
    end
    resources :comments, only: :create
  end
end
