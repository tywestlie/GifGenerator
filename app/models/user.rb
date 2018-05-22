class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password
  has_many :favorites
  has_many :gifs, through: :favorites

  has_secure_password

  enum role: [:default, :admin]
end
