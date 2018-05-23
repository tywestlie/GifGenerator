require 'rails_helper'

describe 'As an admin' do
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
