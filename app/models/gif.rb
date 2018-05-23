class Gif < ApplicationRecord
  validates_presence_of :image_path
  belongs_to :category
  has_many :favorites
  has_many :users, through: :favorites
end
