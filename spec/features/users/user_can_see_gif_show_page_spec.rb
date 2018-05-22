require 'rails_helper'

describe 'default user visits gif index page' do
  it 'clicks on link to gif show page' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')

    visit gifs_path

    click_on "Gif-#{gif1.id}"

    expect(current_path).to eq(gif_path(gif1))
  end

  it 'sees the gif on the show page' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')

    visit gifs_path

    click_on "Gif-#{gif1.id}"

    expect(current_path).to eq(gif_path(gif1))
    within("#gif-#{gif1.id}") do
      expect(page).to have_css("img[src*='#{gif1.image_path}']")
    end
  end
end
