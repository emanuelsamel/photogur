class PicturesController < ApplicationController

  def index
    @pictures = Picture.all

  end

  def show
    @picture = Picture.find(params[:id])
    # render :show  # render the view called show.html.erb
  end
end
