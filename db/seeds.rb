# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url ='http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_raw = JSON.parse(ingredients_serialized)
ingredients = ingredients_raw["drinks"].map { |item| item["strIngredient1"] }
ingredients_sorted = ingredients.sort_by { |item| item.downcase }

ingredients_sorted.each do |ingredient|
  Ingredient.create(name: ingredient.capitalize)
end


