class MovieWatchlistsController < ApplicationController
  before_action :current_user_must_be_movie_watchlist_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_movie_watchlist_user
    movie_watchlist = MovieWatchlist.find(params[:id])

    unless current_user == movie_watchlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.interests.ransack(params[:q])
      @movie_watchlists = @q.result(:distinct => true).includes(:movie, :user).page(params[:page]).per(10)

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

    if @movie_watchlist.save
      redirect_to :back, :notice=> "Watchlist created successfully"
    else render 'new'
    end
  end
      #code

  def edit
    @movie_watchlist = MovieWatchlist.find(params[:id])

    render("movie_watchlists/edit.html.erb")
  end

  def update
    @movie_watchlist = MovieWatchlist.find(params[:id])
    @movie_watchlist.user_id= params[:user_id]
    @movie_watchlist.movie_id = params[:movie_id]

    save_status = @movie_watchlist.save

    if @movie_watchlist.save
      redirect_to "/movie_watchlists", :notice=> "Added to watchlist"
    else
      render 'edit'
    end
  end


  def destroy
    @movie_watchlist = MovieWatchlist.find(params[:id])

    @movie_watchlist.destroy

  redirect_to :back, :notice => "Movie interest deleted."

  end
end
