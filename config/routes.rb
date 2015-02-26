Rails.application.routes.draw do


  resources :movies, :has_many => :comments
  resources :actors, :has_many => :comments

  post '/movies/:id/actors/new' => 'movies#add_actor', as: :add_actor
  delete 'movies/:id/actors/:actor_id' => 'movies#remove_actor', as: :remove_actor

  post '/actors/:id/movies/new' => 'actors#add_movie', as: :add_movie
  delete '/actors/:id/movies/:movie_id' => 'actors#remove_movie', as: :remove_movie

  post '/movies/:id/comments', to: 'comments#create', as: 'movie_comments'
  post '/actors/:id/comments', to: 'comments#create', as: 'actor_comments'

  root 'site#index'

end
