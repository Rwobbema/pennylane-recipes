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
end
