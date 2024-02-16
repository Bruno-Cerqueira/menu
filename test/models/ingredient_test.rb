require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  test "should be invalid without name" do
    ingredient = Ingredient.new
    refute ingredient.valid?, "Ingredient is valid without a name"
  end


  test "should not save a ingredient with existing name" do
    ingredient1 = Ingredient.new(name: "Cenoura")
    ingredient1.save
    ingredient2 = Ingredient.new(name: "Cenoura")
    refute ingredient2.valid?, "Ingredient is valid with duplicate name"
  end
end
