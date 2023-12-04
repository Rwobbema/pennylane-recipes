module RecipesHelper
  def matching_ingredients(search_param, recipe)
    query = search_param.split(',').map(&:strip)
    ingredients = recipe.recipe_ingredients.map { |rp| rp.ingredient.name.downcase }.join(' ')

    query.select { |ingredient| ingredients.include?(ingredient.downcase) }
  end
end
