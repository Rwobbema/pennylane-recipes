class RecipesController < ApplicationController
  def index
    limit = 24
    recipes = if search_query.present?
                Recipe.find_relevant_ingredients_and_order(search_query, limit)
              else
                Recipe.all.limit(limit)
              end

    @recipes = recipes.includes(:author, :category, recipe_ingredients: :ingredient)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def search_query
    return if params[:search].blank?

    params[:search].split(',').map(&:strip)
  end
end
