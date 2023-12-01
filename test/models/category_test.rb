require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
  end

  test 'should have recipes' do
    assert_respond_to @category, :recipes
  end

  test 'should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = '  ' # Invalid name with only spaces
    assert_not @category.valid?
  end

  test 'name should be unique' do
    duplicate_category = @category.dup
    @category.save
    assert_not duplicate_category.valid?
  end
end
