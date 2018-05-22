require 'rails_helper'

describe 'Admin visits a new gif page' do
  it 'can see create a new gif banner' do
    admin = User.create(username:'admin', password: 'admin', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gif_path

    expect(page).to have_content('Create a Gif')
  end

  it 'can create a new gif' do
    image_path = 'https://media.giphy.com/media/3o85xsGXVuYh8lM3EQ/giphy.gif'
    admin = User.create(username:'admin', password: 'admin', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_gif_path
# save_and_open_page
    fill_in ':gif_image_path]', with: image_path
    click_on 'Create Gif'

    expect(current_path).to eq(gifs_path)
  end
end
