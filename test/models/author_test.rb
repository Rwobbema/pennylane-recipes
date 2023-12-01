require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = authors(:one)
  end

  test 'should have recipes' do
    assert_respond_to @author, :recipes
  end

  test 'should be valid' do
    @author.save
    assert @author.valid?
  end

  test 'name should be present' do
    @author.name = '  ' # Invalid name with only spaces
    assert_not @author.valid?
  end

  test 'name should be unique' do
    duplicate_author = @author.dup
    @author.save
    assert_not duplicate_author.valid?
  end
end
