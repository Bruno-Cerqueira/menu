require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @ingredient1 = ingredients(:ingredient1)
    @ingredient2 = ingredients(:ingredient2)
  end

  test "should get index" do
    get '/ingredients'
    assert_response :success
    assert_not_nil assigns(:ingredients)
  end
end
