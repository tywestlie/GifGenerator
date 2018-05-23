require 'rails_helper'

describe 'default user visits gif show page' do
  it 'can add gif to favorites' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(name: 'Ham Sandwich')
    category.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')

    visit gifs_path

    click_on 'Add To Favorites'

    expect(page).to have_content('Added to Favorites!')
  end

  it 'can only add gif once to favorites' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(name: 'Ham Sandwich')
    gif = category.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    user.gifs << gif

    visit gifs_path

    # click_on 'Add To Favorites'
    click_on 'Add To Favorites'

    expect(page).to have_content('Already in Favorites')
  end

  it 'can unfavorite a gif that is favorited' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(name: 'Ham Sandwich')
    gif = category.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    user.gifs << gif

    visit user_path(user)

    click_on('Unfavorite')

    expect(page).to_not have_content('Unfavorite')
  end
end
