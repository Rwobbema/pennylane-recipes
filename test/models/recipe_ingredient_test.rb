require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase

  def setup
    @recipe_ingredient = recipe_ingredients(:one)
  end

  #  test for relations
  test 'should have recipes' do
    assert_respond_to @recipe_ingredient, :recipe
  end

  test 'should have ingredients' do
    assert_respond_to @recipe_ingredient, :ingredient
  end

  # test for validations
  test 'should be valid' do
    @recipe_ingredient.save
    assert @recipe_ingredient.valid?
  end

  test 'should be invalid without ingredient' do
    @recipe_ingredient.ingredient = nil
    assert_not @recipe_ingredient.valid?
  end

  test 'should be invalid without recipe' do
    @recipe_ingredient.recipe = nil
    assert_not @recipe_ingredient.valid?
  end

  test 'should be invalid with duplicate recipe and ingredient' do
    @recipe_ingredient.save
    duplicate_recipe_ingredient = @recipe_ingredient.dup
    duplicate_recipe_ingredient.save
    assert_not duplicate_recipe_ingredient.valid?
  end
end
