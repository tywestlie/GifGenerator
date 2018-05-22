require 'rails_helper'

describe Gif do
  describe 'Validations' do
    it {should validate_presence_of(:image_path)}
  end
end
