require 'rails_helper'

describe 'User visits home page' do
  it 'can link to index from homepage' do
    gif_banner = 'Gifs'
    user = User.create(username: "user", password: 'password', role: 0)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'

    click_on 'Gifs'

    expect(current_path).to eq(gifs_path)
    expect(page).to have_content('Gifs')
  end
end
