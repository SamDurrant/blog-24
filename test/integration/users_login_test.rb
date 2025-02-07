require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with invalid info" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", passsword: "" } }
    assert_response :unprocessable_entity
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
