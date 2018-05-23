class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(gif_params)
    redirect_to gifs_path
  end

  def destroy
    gif = Gif.find(params[:id])
    gif.destroy
    redirect_to gifs_path
  end

  private

  def gif_params
    params.require(:gif).permit(:image_path)
  end
end
