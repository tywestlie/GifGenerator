require 'rails_helper'

describe 'User visits home page and sees category links' do
  context 'As an admin' do
    it 'can remove category'do
      admin = User.create(username: "admin", password: 'password', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category1 = Category.create(name: 'Ham Sandwich')
      category1.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
      category2 = Category.create(name: 'Turkey Sandwich')
      category2.gifs.create(image_path: 'https://media.giphy.com/media/v2CaxWLFw4a5y/giphy.gif')

      visit '/'

      within(".category-#{category1.id}")do
        click_on('Delete')
      end
      expect(page).to_not have_css(".category-#{category1.id}")
    end
  end

  context 'As a default user' do
    it 'Does not see delete option for category' do
      user = User.create(username: "user", password: 'password')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      category1 = Category.create(name: 'Ham Sandwich')
      category1.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
      category2 = Category.create(name: 'Turkey Sandwich')
      category2.gifs.create(image_path: 'https://media.giphy.com/media/v2CaxWLFw4a5y/giphy.gif')

      visit '/'

      expect(page).to_not have_content('Delete')
    end
  end
end
