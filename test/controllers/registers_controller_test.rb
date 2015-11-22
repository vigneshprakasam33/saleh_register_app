require 'test_helper'

class RegistersControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get question" do
    get :question
    assert_response :success
  end

  test "should get picture" do
    get :picture
    assert_response :success
  end

  test "should get signup" do
    get :signup
    assert_response :success
  end

end
