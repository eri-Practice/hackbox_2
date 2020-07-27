Rails.application.routes.draw do
  root to: 'posts#index'
  
  devise_for :users

  resources :posts do
    collection do
      get 'search'
      get 'category'
      get 'rank'
    end
  end
end
