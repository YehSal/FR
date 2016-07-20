require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get history" do
    get :history
    assert_response :success
  end

  test "should get stats" do
    get :stats
    assert_response :success
  end

end
