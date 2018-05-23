class FavoritesController < ApplicationController

  def create
    favorite = Gif.find(params[:gif_id])
    user = User.find(params[:user_id])
    if user.gifs.include?(favorite)
      flash[:error] = 'Already in Favorites'
    else
      if favorite
        user.gifs << favorite
        flash[:success] = 'Added to Favorites!'
      else
        render :file => 'public/404'
      end
    end
    redirect_to gifs_path
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy

    redirect_to user_path(current_user)
  end

  private

  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
