class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :recipe, :ingredient, presence: true
  validates :recipe, uniqueness: { scope: :ingredient }
end
