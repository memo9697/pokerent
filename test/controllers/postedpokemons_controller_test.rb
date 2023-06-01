require "test_helper"

class PostedpokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postedpokemons_index_url
    assert_response :success
  end
end
