require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = ingredients(:one)
  end

  test 'should have recipes' do
    assert_respond_to @ingredient, :recipes
  end

  test 'should be valid' do
    assert @ingredient.valid?
  end

  test 'name should be present' do
    @ingredient.name = '  ' # Invalid name with only spaces
    assert_not @ingredient.valid?
  end

  test 'name should be unique' do
    duplicate_ingredient = @ingredient.dup
    @ingredient.save
    assert_not duplicate_ingredient.valid?
  end
end
