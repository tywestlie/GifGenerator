class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(favorite_params)
    user = User.find(params[:user_id])
    if user.favorites.include?(gif_id: params[:gif_id])
      flash[:error] = 'Already in Favorites'
    else
      if @favorite.save
        flash[:success] = 'Added to Favorites!'
        redirect_to gifs_path
      else
        render :file => 'public/404'
      end
    end
  end

  def destroy
    favorite = Favorite.find(favorite_params)
    favorite.destroy
  end

  private

  def favorite_params
    params.permit(:user_id, :gif_id)
  end
end
