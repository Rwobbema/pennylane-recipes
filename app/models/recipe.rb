class Recipe < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
end
