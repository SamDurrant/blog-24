require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid user signup info" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                        email: "user.invalid",
                                        password: "     foo",
                                        password_confiration: "bar" } }
    end

    assert_response :unprocessable_entity
    assert_template 'users/new'

    assert_select "div.alert.alert-danger"
  end

  test "valid user signup info" do
    get signup_path

    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "sam sam",
                                        email: "sam.sam@sam.com",
                                        password: "password",
                                        password_confiration: "password" } }
    end

    follow_redirect!
    assert_template 'users/show'

    assert_not flash[:danger]
    assert_select "div.alert.alert-success"
  end
end
