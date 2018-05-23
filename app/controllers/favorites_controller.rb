class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(favorite_params)
    if user.favorites.include?(gif_id: params[:gif_id])
      if @favorite.save
        flash[:success] = 'Added to Favorites!'
        redirect_to gifs_path
      else
        render :file => 'public/404'
      end
    end
  end

  private

  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
