class Admin::GifsController < Admin::BaseController

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def create
    @gif = Gif.create(gif_params)
    redirect_to gifs_path
  end

  private

  def gif_params
    params.require(:gif).permit(:image_path)
  end
end
