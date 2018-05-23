class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: params[:id])

    @gifs = @favorites.map do |favorite|
        Gif.find_by("id = #{favorite.gif_id}")
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
