require 'rails_helper'
describe 'Visitor visits a home page' do
  describe 'As a default user' do
  it'can see gif categories' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category1 = Category.create(name: 'Ham Sandwich')
    category1.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    category2 = Category.create(name: 'Turkey Sandwich')
    category2.gifs.create(image_path: 'https://media.giphy.com/media/v2CaxWLFw4a5y/giphy.gif')

    visit '/'

    expect(page).to have_content('Ham Sandwich')
    expect(page).to have_content('Turkey Sandwich')
  end

  it 'can link to category show page' do
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category1 = Category.create(name: 'Ham Sandwich')
    category1.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    category2 = Category.create(name: 'Turkey Sandwich')
    category2.gifs.create(image_path: 'https://media.giphy.com/media/v2CaxWLFw4a5y/giphy.gif')

    visit '/'

    click_on('Ham Sandwich')

    expect(current_path).to eq(gifs_path)
  end
end
end
