class PicturesController < ApplicationController

  def index
    @pictures = Picture.all

  end

  def show
    @picture = Picture.find(params[:id])
    # render :show  # render the view called show.html.erb
  end

  def new
    @picture = Picture.new
  end

  def create
render text: "Received POST request to '/pictures' with the data URL: #{params}"
  end
end
