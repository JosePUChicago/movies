class TheatersController < ApplicationController
  def index
    @theaters = Theater.all

    render("theaters/index.html.erb")
  end

  def show
    @theater = Theater.find(params[:id])

    render("theaters/show.html.erb")
  end

  def new
    @theater = Theater.new

    render("theaters/new.html.erb")
  end

  def create
    @theater = Theater.new

    @theater.address = params[:address]
    @theater.name = params[:name]

    save_status = @theater.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/theaters/new", "/create_theater"
        redirect_to("/theaters")
      else
        redirect_back(:fallback_location => "/", :notice => "Theater created successfully.")
      end
    else
      render("theaters/new.html.erb")
    end
  end

  def edit
    @theater = Theater.find(params[:id])

    render("theaters/edit.html.erb")
  end

  def update
    @theater = Theater.find(params[:id])

    @theater.address = params[:address]
    @theater.name = params[:name]

    save_status = @theater.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/theaters/#{@theater.id}/edit", "/update_theater"
        redirect_to("/theaters/#{@theater.id}", :notice => "Theater updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Theater updated successfully.")
      end
    else
      render("theaters/edit.html.erb")
    end
  end

  def destroy
    @theater = Theater.find(params[:id])

    @theater.destroy

    if URI(request.referer).path == "/theaters/#{@theater.id}"
      redirect_to("/", :notice => "Theater deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Theater deleted.")
    end
  end
end
