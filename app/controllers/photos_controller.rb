class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:show]
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
    binding.pry
    @photo = Photo.find(params[:id])
    @photo.avg_rating = Photo.get_avg_rating(@photo)
    @photo.save
    @comment = current_user.comments.new
    @tag = current_user.tags.new
    @tags = Tag.all
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
