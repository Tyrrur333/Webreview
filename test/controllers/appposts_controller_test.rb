require 'test_helper'

class ApppostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appposts_index_url
    assert_response :success
  end

  test "should get show" do
    get appposts_show_url
    assert_response :success
  end

  test "should get new" do
    get appposts_new_url
    assert_response :success
  end

  test "should get edit" do
    get appposts_edit_url
    assert_response :success
  end

end
