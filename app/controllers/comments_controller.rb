class CommentsController < ApplicationController
  def new
    binding.pry
    @photo = Photo.find(params[:id])
    @comment = current_user.comments.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = current_user.comments.new(comment_params)
    @comment.photo_id = @photo.id
    if @comment.save
      redirect_to photo_path(@photo)
    else
      render :_new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :photo_id)
  end
end
