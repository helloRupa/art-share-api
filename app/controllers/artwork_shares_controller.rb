class ArtworkSharesController < ApplicationController
  def create
    share = ArtworkShare.new(share_params)

    if share.save
      render json: share
    else
      render share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    share = ArtworkShare.find_by_id(params[:id])

    if share.destroy
      render json: share
    else
      render plain: 'Cannot delete that artwork share'
    end
  end

  private

  def share_params
    params.require(:share).permit(:artwork_id, :viewer_id)
  end
end