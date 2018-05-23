class FavoritesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @gif = Gif.find(params[:gif_id])
    @favorite = Favorite.new
    require 'pry'; binding.pry
    redirect_to gifs_path
  end

  def create
    @user = User.find(params[:user_id])
    favorite = @user.favorites.create(favorite_params)
    if favorite.save
      flash[:success] = 'Added to Favorites!'
    end
    redirect_to gifs_path
  end

  private

  def favorite_params
    params.require(:favorite).permit(:user_id, :gif_id)
  end
end
