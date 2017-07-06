class TagsController < ApplicationController
  def new
    @photo = Photo.find(params[:id])
    @tag = current_user.tags.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @tag = current_user.tags.new(tag_params)
    @tag.photo_id = @photo.id
    if @tag.save
      redirect_to photo_path(@photo)
    else
      render :_new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end
end
