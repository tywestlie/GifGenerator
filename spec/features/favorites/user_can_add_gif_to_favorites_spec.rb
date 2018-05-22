require 'rails_helper'

describe 'default user visits gif show page' do
  xit 'can add gif to favorites' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')

    visit gifs_path(gif1)

    click_on 'Add To Favorites'

    expect(page).to have_content('Added to Favorites!')
  end
end
