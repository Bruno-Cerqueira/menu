require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'route home' do
    assert_generates '/', controller: 'homes', action: 'index'
  end
end
