require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = recipes(:one)
  end

  test 'should have author' do
    assert_respond_to @recipe, :author
  end

  test 'should have category' do
    assert_respond_to @recipe, :category
  end

  test 'should have ingredients' do
    assert_respond_to @recipe, :ingredients
  end

  test 'should be valid' do
    @recipe.save
    assert @recipe.valid?
  end

  test 'title should be present' do
    @recipe.title = '  ' # Invalid title with only spaces
    assert_not @recipe.valid?
  end

  test 'cook time should be present' do
    @recipe.cook_time = nil
    assert_not @recipe.valid?
  end

  test 'prep time should be present' do
    @recipe.prep_time = nil
    assert_not @recipe.valid?
  end

  test 'ratings should be present' do
    @recipe.ratings = nil
    assert_not @recipe.valid?
  end

  test 'image URL should be present' do
    @recipe.image_url = '  ' # Invalid image URL with only spaces
    assert_not @recipe.valid?
  end
end
