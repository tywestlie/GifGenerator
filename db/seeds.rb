# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gifs = ['https://media.giphy.com/media/cfuL5gqFDreXxkWQ4o/giphy.gif', 'https://media.giphy.com/media/wysyxWt4ZlQ9q/giphy.gif', 'https://media.giphy.com/media/JfDNFU1qOZna/giphy.gif', 'https://media.giphy.com/media/mokQK7oyiR8Sk/giphy.gif', 'https://media.giphy.com/media/3ornjSL2sBcPflIDiU/giphy.gif']

gifs.each do |image_path|
  Gif.create(image_path: image_path)
end

User.create(username: 'admin', password: 'password', role: 1)
