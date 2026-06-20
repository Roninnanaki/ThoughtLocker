require "test_helper"

class AuthenticationTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create!(name: "user", email: "user@example.com",
                         password: "foobar10", password_confirmation: "foobar10")
  end

  test "signin page renders" do
    get signin_path
    assert_response :success
    assert_select "h2", "Sign in"
  end

  test "signin with invalid info" do
    get signin_path
    post sessions_path, params: { session: { email: "", password: "" } }
    assert_response :unprocessable_entity
    assert_select "div.alert"
  end

  test "signin with valid info" do
    post sessions_path, params: { session: { email: @user.email, password: "foobar10" } }
    assert_redirected_to @user
    follow_redirect!
    assert_response :success
  end

  test "signup page renders" do
    get signup_path
    assert_response :success
  end

  test "signup with valid info" do
    assert_difference "User.count", 1 do
      post users_path, params: { user: { email: "new@example.com",
                                          password: "newpass10",
                                          password_confirmation: "newpass10" } }
    end
    assert_redirected_to User.last
  end
end
