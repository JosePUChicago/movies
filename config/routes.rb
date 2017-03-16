Rails.application.routes.draw do
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
