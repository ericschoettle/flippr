class PhotosController < ApplicationController

  def index
    @photos = current_user.photos.all 
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to user_photo_path(current_user, @photo)
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = current_user.comments.new
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "Photo has been deleted."
    redirect_to user_photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:attached_photo, :user_id)
  end

end
