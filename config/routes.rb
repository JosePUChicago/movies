Rails.application.routes.draw do
  root :to => "movies#index"
  # Routes for the Movie_watchlist resource:
  # CREATE
  get "/movie_watchlists/new", :controller => "movie_watchlists", :action => "new"
  post "/create_movie_watchlist", :controller => "movie_watchlists", :action => "create"

  # READ
  get "/movie_watchlists", :controller => "movie_watchlists", :action => "index"
  get "/movie_watchlists/:id", :controller => "movie_watchlists", :action => "show"

  # UPDATE
  get "/movie_watchlists/:id/edit", :controller => "movie_watchlists", :action => "edit"
  post "/update_movie_watchlist/:id", :controller => "movie_watchlists", :action => "update"

  # DELETE
  get "/delete_movie_watchlist/:id", :controller => "movie_watchlists", :action => "destroy"
  #------------------------------

  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Showtime resource:
  # CREATE
  get "/showtimes/new", :controller => "showtimes", :action => "new"
  post "/create_showtime", :controller => "showtimes", :action => "create"

  # READ
  get "/showtimes", :controller => "showtimes", :action => "index"
  get "/showtimes/:id", :controller => "showtimes", :action => "show"

  # UPDATE
  get "/showtimes/:id/edit", :controller => "showtimes", :action => "edit"
  post "/update_showtime/:id", :controller => "showtimes", :action => "update"

  # DELETE
  get "/delete_showtime/:id", :controller => "showtimes", :action => "destroy"
  #------------------------------

  # Routes for the Theater resource:
  # CREATE
  get "/theaters/new", :controller => "theaters", :action => "new"
  post "/create_theater", :controller => "theaters", :action => "create"

  # READ
  get "/theaters", :controller => "theaters", :action => "index"
  get "/theaters/:id", :controller => "theaters", :action => "show"

  # UPDATE
  get "/theaters/:id/edit", :controller => "theaters", :action => "edit"
  post "/update_theater/:id", :controller => "theaters", :action => "update"

  # DELETE
  get "/delete_theater/:id", :controller => "theaters", :action => "destroy"
  #------------------------------

  # Routes for the Movie resource:
  # CREATE
  get "/movies/new", :controller => "movies", :action => "new"
  post "/create_movie", :controller => "movies", :action => "create"

  # READ
  get "/movies", :controller => "movies", :action => "index"
  get "/movies/:id", :controller => "movies", :action => "show"

  # UPDATE
  get "/movies/:id/edit", :controller => "movies", :action => "edit"
  post "/update_movie/:id", :controller => "movies", :action => "update"

  # DELETE
  get "/delete_movie/:id", :controller => "movies", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
