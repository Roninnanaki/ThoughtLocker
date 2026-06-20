require "test_helper"

class BlogTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(name: "user", email: "user@example.com",
                         password: "foobar10", password_confirmation: "foobar10")
    @blog = @user.blogs.build(name: "Test Blog")
  end

  test "should be valid" do
    assert @blog.valid?
  end

  test "user_id should be present" do
    @blog.user_id = nil
    assert_not @blog.valid?
  end

  test "name should be present" do
    @blog.name = " "
    assert_not @blog.valid?
  end

  test "name should not be too long" do
    @blog.name = "a" * 101
    assert_not @blog.valid?
  end
end
