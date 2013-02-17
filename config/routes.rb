Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => "movies#index"

  #get "/movies/:director" => "movies#director"
  match 'movies/:id/director', :to => 'movies#director'
end

