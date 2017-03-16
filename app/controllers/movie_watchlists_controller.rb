class MovieWatchlistsController < ApplicationController
  before_action :current_user_must_be_movie_watchlist_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_movie_watchlist_user
    movie_watchlist = MovieWatchlist.find(params[:id])

    unless current_user == movie_watchlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @movie_watchlists = current_user.interests.page(params[:page]).per(10)

    render("movie_watchlists/index.html.erb")
  end

  def show
    @movie_watchlist = MovieWatchlist.find(params[:id])

    render("movie_watchlists/show.html.erb")
  end

  def new
    @movie_watchlist = MovieWatchlist.new

    render("movie_watchlists/new.html.erb")
  end

  def create
    @movie_watchlist = MovieWatchlist.new

    @movie_watchlist.user_id = params[:user_id]
    @movie_watchlist.movie_id = params[:movie_id]

    save_status = @movie_watchlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/movie_watchlists/new", "/create_movie_watchlist"
        redirect_to("/movie_watchlists")
      else
        redirect_back(:fallback_location => "/", :notice => "Movie watchlist created successfully.")
      end
    else
      render("movie_watchlists/new.html.erb")
    end
  end

  def edit
    @movie_watchlist = MovieWatchlist.find(params[:id])

    render("movie_watchlists/edit.html.erb")
  end

  def update
    @movie_watchlist = MovieWatchlist.find(params[:id])
    @movie_watchlist.movie_id = params[:movie_id]

    save_status = @movie_watchlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/movie_watchlists/#{@movie_watchlist.id}/edit", "/update_movie_watchlist"
        redirect_to("/movie_watchlists/#{@movie_watchlist.id}", :notice => "Movie watchlist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Movie watchlist updated successfully.")
      end
    else
      render("movie_watchlists/edit.html.erb")
    end
  end

  def destroy
    @movie_watchlist = MovieWatchlist.find(params[:id])

    @movie_watchlist.destroy

    if URI(request.referer).path == "/movie_watchlists/#{@movie_watchlist.id}"
      redirect_to("/", :notice => "Movie watchlist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Movie watchlist deleted.")
    end
  end
end
