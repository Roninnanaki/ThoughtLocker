require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "user", email: "user@example.com",
                     password: "foobar10", password_confirmation: "foobar10")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email should reject invalid addresses" do
    invalid = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalid.each do |addr|
      @user.email = addr
      assert_not @user.valid?, "#{addr} should be invalid"
    end
  end

  test "email should accept valid addresses" do
    valid = %w[user@foo.com A_USER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    valid.each do |addr|
      @user.email = addr
      assert @user.valid?, "#{addr} should be valid"
    end
  end

  test "email should be unique" do
    dup = @user.dup
    dup.email = @user.email.upcase
    @user.save
    assert_not dup.valid?
  end

  test "password should have minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticate with valid password" do
    @user.save
    found = User.find_by(email: @user.email)
    assert_equal @user, found.authenticate(@user.password)
  end

  test "authenticate with invalid password" do
    @user.save
    found = User.find_by(email: @user.email)
    assert_not found.authenticate("invalid")
  end

  test "remember token should be set on save" do
    @user.save
    assert_not_nil @user.remember_token
  end

  test "should have blogs association" do
    assert @user.respond_to?(:blogs)
  end

  test "following and unfollowing a blog" do
    @user.save
    other = User.create!(name: "other", email: "other@example.com",
                         password: "foobar10", password_confirmation: "foobar10")
    blog = other.blogs.create!(name: "Test Blog")

    @user.follow!(blog)
    assert @user.following?(blog)

    @user.unfollow!(blog)
    assert_not @user.following?(blog)
  end
end
