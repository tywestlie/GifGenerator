require 'rails_helper'

describe 'User visits a new gif page' do
  context 'As an Admin' do
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

      fill_in 'gif[image_path]', with: image_path
      click_on 'Create Gif'

      expect(current_path).to eq(gifs_path)
    end

    it 'can delete a gif' do
      admin = User.create(username:'admin', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      gif1 = Gif.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
      gif2 = Gif.create(image_path: 'https://media.giphy.com/media/1APg5tPRfzpn8zSIs2/giphy.gif')

      visit gifs_path

      within("#gif-#{gif1.id}") do
        click_on 'Delete'
      end


      expect(page).to_not have_css("gif-#{gif1.id}")
    end

    it 'can create a giphy' do
      admin = User.create(username:'admin', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      fill_in 'Category', with: 'Dogs'
      click_on 'Generate Gif'

      expect(current_path).to eq(gifs_path)
      expect(page).to have_content('Dogs')
      expect(Gif.count).to eq(1)
      expect(Category.count).to eq(1)
    end

    it 'it can see a form for create gif' do
      admin = User.create(username:'admin', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      expect(page).to have_field('Category')
      expect(page).to have_button('Generate Gif')
    end

  context 'As a default user' do
    it 'cannot delete a gif from index' do
      user = User.create(username: "user", password: 'password', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path


    end
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
