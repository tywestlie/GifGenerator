class Admin::GifsController < ApplicationController

  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end
end
