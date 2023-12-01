class Recipe < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  validates :title, :cook_time, :prep_time, :ratings, :image_url, presence: true
end
