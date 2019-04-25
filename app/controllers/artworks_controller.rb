class ArtworksController < ApplicationController
  def index
    user = User.find_by_id(params[:user_id])

    render json: { artworks: user.artworks, shares: user.shared_artworks }
  end

  def create
    artwork = Artwork.new(artwork_params)

    if artwork.save
      render json: artwork
    else
      render artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by_id(params[:id])

    if artwork
      render json: artwork
    else
      render plain: 'Artwork does not exist'
    end
  end

  def update
    artwork = Artwork.find_by_id(params[:id])

    if artwork.update_attributes(artwork_params)
      render json: artwork
    else
      render artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find_by_id(params[:id])

    if artwork.destroy
      render json: artwork
    else
      render plain: 'Cannot destroy artwork'
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end