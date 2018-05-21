require 'rails_helper'

describe 'Visitor' do
  context 'fills in registation' do
    it 'should make an account' do
    username = 'Tyler'
    password = 'secret123'
    visit '/'
    click_on 'Create Account'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: password
    click_on 'Create User'


    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{username}")
    end
  end
end
