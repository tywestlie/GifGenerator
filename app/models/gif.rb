class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  def self.category_select(category_name)
    category = Category.where(name: category_name).first
    something = Gif.where(category: category)
  end
end
