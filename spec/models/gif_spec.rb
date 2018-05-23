require 'rails_helper'

describe Gif do
  describe 'Validations' do
    it {should validate_presence_of(:image_path)}
  end

  describe 'Relationships' do
    it {should belong_to(:category)}
  end

  describe 'Class Methods' do
    it 'it can sort gifs by category'do
    category1 = Category.create(name: 'Ham')
    gif = category1.gifs.create(image_path: 'https://media.giphy.com/media/YUHorv6RGc9zyoeupp/giphy.gif')
    category2 = Category.create(name: 'Pizza')
    gif2 = category2.gifs.create(image_path: 'https://media.giphy.com/media/v2CaxWLFw4a5y/giphy.gif')

    categories = Gif.category_select('Ham')
    expect(categories).to eq([gif])
  end
end
end
