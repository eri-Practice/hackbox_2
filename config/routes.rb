Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts do
    collection do
      get 'search'
      get 'category'
      get 'rank'
    end
  end
end
