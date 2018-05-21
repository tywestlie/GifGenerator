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

      click_on 'Log in'

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

      click_on 'Log in'

      visit user_path(user)

      click_on 'Log out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('GifGenerator')
    end

    it 'should be able to log in from nav' do
      username = 'Tyler'
      password = 'secret'

    end
  end
end
