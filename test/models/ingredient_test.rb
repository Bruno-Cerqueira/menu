require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @ingredient = ingredients(:ingredient1)
  end

  test 'valid ingredient' do
    assert @ingredient.valid?
  end

  test 'should be invalid without name' do
    @ingredient.name = nil
    refute @ingredient.valid?, 'Ingredient is valid without a name'
    assert_not_nil @ingredient.errors[:name][0], 'no validation error for name present'
  end

  test 'should not save an ingredient with existing name' do
    ingredient1 = @ingredient
    ingredient1.save
    ingredient2 = Ingredient.new(name: @ingredient.name)
    refute ingredient2.valid?, 'Ingredient is valid with duplicate name'
    assert_not_nil ingredient2.errors[:name][0], 'no validation error for name present'
  end
end
