Rails.application.routes.draw do
  root to: 'posts#index'
  
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    member do
      get :like_posts
      get :followings
    end
  end

  resources :posts do
    collection do
      get 'search'
      get 'category'
      get 'rank'
    end
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
  end
end
