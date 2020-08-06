Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/movies/:search_term', to: 'movie#movies'

  post "/sign-in", to: "users#sign_in"

  resources :users, only: [:create]

  # resources :reviews, only: [:index, :create, :show]
  post '/reviews', to: 'reviews#review'

  get '/reviews/:movie_id', to: "reviews#get_reviews"
end
