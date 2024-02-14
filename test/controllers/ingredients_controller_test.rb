require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    Ingredient.stub(:all, [ingredients(:ingredient1), ingredients(:ingredient2)]) do
      get :index
      assert_response :success
      assert_not_nil assigns(:ingredients)
    end
  end
end
