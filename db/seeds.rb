# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "start time #{Time.now.strftime('%H:%M:%S')}"

source_path = Rails.root.join('db', 'seeds', 'recipes-en.json')
json_recipes = JSON.parse(File.read(source_path))

# In case there are already recipes in the database
recipe_start_id = Recipe.last&.id || 0

puts 'Insert all categories'
# Insert all categories
categories_list = json_recipes.map { |recipe| { name: recipe['category'] } }.uniq
categories_hash = Category.insert_all(categories_list, returning: %w[id name])

puts 'Insert all authors'
# Insert all authors
authors_list = json_recipes.map { |recipe| { name: recipe['author'] } }.uniq
authors_hash = Author.insert_all!(authors_list, returning: %w[id name])

puts 'Insert all ingredients'
# Insert all ingredients
ingredients_list = json_recipes.map { |recipe| recipe['ingredients'] }.flatten.uniq
                               .map { |ingredient| { name: ingredient } }
ingredients_hash = Ingredient.insert_all(ingredients_list, returning: %w[id name])

puts 'Insert all recipes'
# Insert all recipes
recipes_list = json_recipes.map do |recipe|
  category_id = categories_hash.select { |c| c['name'] == recipe['category'] }.dig(0, 'id')
  author_id = authors_hash.select { |a| a['name'] == recipe['author'] }.dig(0, 'id')

  {
    title: recipe['title'],
    cook_time: recipe['cook_time'],
    prep_time: recipe['prep_time'],
    ratings: recipe['ratings'],
    image_url: recipe['image_url'],
    category_id:,
    author_id:
  }
end

Recipe.insert_all!(recipes_list)

puts 'Insert all recipe_ingredients'
# Insert all recipe_ingredients
recipes = json_recipes.map.with_index(recipe_start_id + 1) { |r, index| [index, r['ingredients']] }

recipe_ingredients_list = ingredients_hash.map do |ingredient|
  matching_recipes = recipes.select { |_id, ingredients| ingredients.include?(ingredient['name']) }

  matching_recipes.map do |recipe_id, _ingredients|
    { recipe_id:, ingredient_id: ingredient['id'] }
  end
end

RecipeIngredient.insert_all!(recipe_ingredients_list.flatten)

puts "End time #{Time.now.strftime('%H:%M:%S')}"
