Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:user_id/posts' => 'posts#index', as: :user_posts
  # get '/users/:user_id/posts/:id' => 'posts#show', as: :user_post

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end
end
