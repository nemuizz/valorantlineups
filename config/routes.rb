Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    # Twitter API認証用
    :omniauth_callbacks => 'users/omniauth_callbacks',
  }
  
  resources :users, only: [:show] do
    collection do
      get "/:id/favorites" => "users#favorites"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "home#top"
  get '/home/policy' => 'home#policy'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    collection do
      get 'search'
    end

    resource :favorite, only: [:create, :destroy]
    
  end
end
