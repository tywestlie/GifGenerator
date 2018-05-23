class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
