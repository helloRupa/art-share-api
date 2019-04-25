class CommentsController < ApplicationController
  def index
    if params.key?(:user_id)
      render json: User.find_by_id(params[:user_id]).comments
    else
      render json: Artwork.find_by_id(params[:artwork_id]).comments
    end
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:id])
    if comment.destroy
      render json: comment
    else
      render plain: 'Cannot destroy comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end