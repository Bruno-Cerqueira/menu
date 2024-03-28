require 'test_helper'

class IngredientQuantityTest < ActiveSupport::TestCase
  def setup
    @ingredient = ingredients(:ingredient1)
    @ingredient_quantities = ingredient_quantities(:one)
  end

  test 'ingredient quantities' do
    assert_equal 1, @ingredient.ingredient_quantities.size
  end

  test 'should be invalid with less than 0 quantities' do
    @ingredient_quantities.quantity = -2
    refute @ingredient_quantities.valid?, 'no validation error for minimal quantity'
    assert_not_nil @ingredient_quantities.errors[:quantity][0], 'no validation error for minimal quantity'
  end

  test 'should be invalid with no measurement type presence' do
    @ingredient_quantities.measurement_type = nil
    refute @ingredient_quantities.valid?, 'no validation error for measurement_type presence'
    assert_not_nil @ingredient_quantities.errors[:measurement_type][0], 'no validation error for measurement_type presence'
  end
end
