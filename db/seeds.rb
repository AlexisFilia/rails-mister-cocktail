require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Cleaning the database"
Ingredient.destroy_all

puts "Creating the ingredient list from the Wagon list"

ingredients["drinks"].each do |ingredient|
  # puts ingredient["strIngredient1"]
  Ingredient.create(ingredient[:strIngredient1])
end

puts "Database ready"
