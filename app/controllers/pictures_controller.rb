class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    @most_recent_pictures = Picture.most_recent_five

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
    @picture = Picture.create (picture_params)
    if @picture.save
      # if the picture gets saved, generate a get request to "/pictures" (the index)
      redirect_to "/pictures"
    else
      # otherwise render new.html.erb
      render :new
    end
  end

  def picture_params
    params.require(:picture).permit(title:, artist:, url:)
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    # use the same picture_params method that we used in create
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end
end
