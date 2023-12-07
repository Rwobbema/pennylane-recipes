class Recipe < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, :cook_time, :prep_time, :ratings, :image_url, presence: true

  # The relevance is based on the total number of times the ingredients are used in a recipe.
  def self.find_relevant_ingredients(ingredient_names)
    ingredient_names = ingredient_names.map { |val| "% #{val} %" }

    joins(:ingredients)
      .where('ingredients.name LIKE ANY (array[?])', ingredient_names)
      .group('recipes.id')
      .order(Arel.sql('COUNT(DISTINCT ingredients.name) DESC'))
  end

  # Not as fast as the other but it gives more relevant results.
  def self.find_relevant_ingredients_and_order(ingredient_names, limit)
    ingredient_names = ingredient_names.map { |val| "%#{val}%" }
    recipes = joins(:ingredients).where('ingredients.name LIKE ANY (array[?])', ingredient_names)

    recipe_ids = ingredient_names.map do |name|
      recipes.where('ingredients.name LIKE ?', name).pluck(:id).uniq
    end

    ordered_recipe_ids = recipe_ids.flatten.tally.sort_by(&:last).reverse.map(&:first).first(limit)
    where(id: ordered_recipe_ids).in_order_of(:id, ordered_recipe_ids)
  end
end
