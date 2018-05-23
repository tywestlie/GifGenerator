class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new
  end

  def create
    # @gif = Gif.create(gif_params)

    @category = Category.find_or_create_by(name: params[:category])
    api_instance = GiphyClient::DefaultApi.new

    api_key = ENV['giphy_api_key'] # String | Giphy API Key.

    opts = {
      tag: @category.name # String | Filters results by specified tag.
      # rating: "g", # String | Filters results by specified rating.
      # fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }

    result = api_instance.gifs_random_get(api_key, opts)

    @gif = @category.gifs.create(image_path: result.data.image_url)

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
