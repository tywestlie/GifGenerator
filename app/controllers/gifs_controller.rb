class GifsController < ApplicationController

  def index
    if params[:category]
      @gifs = Gif.category_select(params[:category])
      render 'gifs/categories'
    else
      @gifs = Gif.all
    end
  end

  def show
    @gif = Gif.find(params[:id])
  end
end
