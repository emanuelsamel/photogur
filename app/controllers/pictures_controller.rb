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
# render text: "Received POST request to '/pictures' with the data URL: #{params}"
@picture = Picture.new(picture_params)
    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def picture_params
      { title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url] }
    end
end
