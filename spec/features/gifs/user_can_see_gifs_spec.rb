require 'rails_helper'

describe 'A user can see gif index' do
  it 'should show all created gifs' do
    gif_banner = 'Gifs'
    gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    gif2 = Gif.create(image_path: 'https://media.giphy.com/media/1APg5tPRfzpn8zSIs2/giphy.gif')
    
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit gifs_path



    expect(page).to have_content(gif_banner)

    within("#gif-#{gif1.id}") do
      expect(page).to have_css("img[src*='#{gif1.image_path}']")
    end
      within("#gif-#{gif2.id}") do
        expect(page).to have_css("img[src*='#{gif2.image_path}']")
      end
  end
end
