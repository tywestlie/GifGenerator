require 'rails_helper'

describe 'Visitor' do
  context 'logs in' do
    it 'should log in the user' do
      username = 'Tyler'
      password = 'secret'
      user = User.create!(username: username, password: password)

      visit '/'

      click_on 'Log in'

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password

      within('div.user-login') do
        click_on 'Log in'
      end

      expect(current_path).to eq(user_path(user))
    end

    it 'should be able to log out' do
      username = 'Tyler'
      password = 'secret'
      user = User.create!(username: username, password: password)

      visit '/'

      click_on 'Log in'

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password

      within('div.user-login') do
        click_on 'Log in'
      end

      visit user_path(user)

      within('div.user-logout') do
        click_on 'Log out'
      end

      expect(current_path).to eq(root_path)
      expect(page).to have_content('GifGenerator')
    end

    it 'should be able to log in from nav bar' do
      username = 'Tyler'
      password = 'secret'
      user = User.create!(username: username, password: password)

      visit '/'
      
      within('nav') do
        click_on 'Log in'
      end

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password

      within('div.user-login') do
        click_on 'Log in'
      end

      expect(current_path).to eq(user_path(user))
    end
  end
end
