class PhotosController < ApplicationController
  layout "pages"
	def index
    @photos = Photo.all
  end
 
  def new
    @photo = Photo.new
  end
 
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photo saved!"
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.destroy(params[:id])
    if @photo.destroy
      flash[:notice] = "Photo deleted!"
      redirect_to :back
    else
      flash[:notice] = "Photo wasn't deleted!"
      redirect_to :back 
    end
  end
 
  private
 
  def photo_params
    params.require(:photo).permit(:image, :title)
  end
end
