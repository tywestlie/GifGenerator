class GifsController < ApplicationController
  def index
    @gifs = Gif.all
    # require 'pry'; binding.pry
  end
end
