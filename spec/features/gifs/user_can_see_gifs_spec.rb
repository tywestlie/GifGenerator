require 'rails_helper'

describe 'A user can see gif index' do
  it 'should show all created gifs' do
    gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    gif2 = Gif.create(image_path: 'https://media.giphy.com/media/1APg5tPRfzpn8zSIs2/giphy.gif')

    visit gifs_path
    expect(page.find("img.gif-1")).should have_content gif1.image_path
    # expect(page.find(".#{gif2.id}")['src']).to have_content "#{gif2.image_path}"
  end
end
