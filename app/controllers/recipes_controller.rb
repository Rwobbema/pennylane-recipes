class RecipesController < ApplicationController
  def index
    recipes = if search_query.present?
                Recipe.find_relevant_ingredients(search_query)
              else
                Recipe.all
              end

    @recipes = recipes.limit(24).includes(:author, :category, recipe_ingredients: :ingredient)
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
