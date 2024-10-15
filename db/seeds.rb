# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

=begin
Post.create!(image:"https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-
13189.jpg?w=2000", title: "En la mente de un gato", description: "Es un libro que explica de forma
simple lo que realmente se sabe de los gatos y lo mucho que falta por entender. Es un libro que
todo aquel que tenga o quiera tener un gato encontrará útil.", user_id: User.last.id)
=end
require 'faker'
#User.create!(email: 'e@e.cl',password:'admin1234',role: 2)

while Category.count < 10
  if !Category.pluck(:name).include?(Faker::Game.genre)
    unique_name = Faker::Game.genre
    Category.create(name: unique_name)
  end
end