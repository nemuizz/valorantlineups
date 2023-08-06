Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:show] do
    collection do
      get "/:id/favorites" => "users#favorites"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#top"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    collection do
      get 'search'
    end

    resource :favorite, only: [:create, :destroy]
    
  end
end
