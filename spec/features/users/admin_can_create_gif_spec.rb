require 'rails_helper'

describe 'User visits a new gif page' do
  context 'As an Admin' do
    it 'can see create a new gif banner' do
      admin = User.create(username:'admin', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      expect(page).to have_content('Create a Gif')
    end

    xit 'can create a new gif' do
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

  context 'As a default user' do
    it 'does not allow default user to see new gif page' do
      user = User.create(username: "user", password: 'password', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_gif_path

      expect(page).to_not have_content("Create a Gif")
    end
  end
end
