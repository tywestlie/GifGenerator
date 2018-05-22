class Admin::GifsController < Admin::BaseController

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end
end
