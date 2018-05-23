require 'rails_helper'

describe 'Vists gif index page' do
  context 'Admin visits index page' do
    it 'should see link to new gif page' do
      admin = User.create(username:'admin', password: 'admin', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit gifs_path

      click_on 'Add New Gif'

      expect(current_path).to eq(new_admin_gif_path)
    end
  end
end
