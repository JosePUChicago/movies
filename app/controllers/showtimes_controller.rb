class ShowtimesController < ApplicationController
  def index
    @showtimes = Showtime.all

    render("showtimes/index.html.erb")
  end

  def show
    @showtime = Showtime.find(params[:id])

    render("showtimes/show.html.erb")
  end

  def new
    @showtime = Showtime.new

    render("showtimes/new.html.erb")
  end

  def create
    @showtime = Showtime.new

    @showtime.datetime = params[:datetime]
    @showtime.time = params[:time]
    @showtime.movie_id = params[:movie_id]
    @showtime.theater_id = params[:theater_id]
    @showtime.quals = params[:quals]
    @showtime.ticketurl = params[:ticketurl]

    save_status = @showtime.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/showtimes/new", "/create_showtime"
        redirect_to("/showtimes")
      else
        redirect_back(:fallback_location => "/", :notice => "Showtime created successfully.")
      end
    else
      render("showtimes/new.html.erb")
    end
  end

  def edit
    @showtime = Showtime.find(params[:id])

    render("showtimes/edit.html.erb")
  end

  def update
    @showtime = Showtime.find(params[:id])

    @showtime.datetime = params[:datetime]
    @showtime.time = params[:time]
    @showtime.movie_id = params[:movie_id]
    @showtime.theater_id = params[:theater_id]
    @showtime.quals = params[:quals]
    @showtime.ticketurl = params[:ticketurl]

    save_status = @showtime.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/showtimes/#{@showtime.id}/edit", "/update_showtime"
        redirect_to("/showtimes/#{@showtime.id}", :notice => "Showtime updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Showtime updated successfully.")
      end
    else
      render("showtimes/edit.html.erb")
    end
  end

  def destroy
    @showtime = Showtime.find(params[:id])

    @showtime.destroy

    if URI(request.referer).path == "/showtimes/#{@showtime.id}"
      redirect_to("/", :notice => "Showtime deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Showtime deleted.")
    end
  end
end
