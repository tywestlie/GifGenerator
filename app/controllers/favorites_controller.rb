class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(favorite_params)
    if @favorite.save
      flash[:success] = 'Added to Favorites!'
      redirect_to gifs_path
    else
      render :file => 'public/404'
    end
  end

  private

  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
