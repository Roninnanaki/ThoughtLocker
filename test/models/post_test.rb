require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    user = User.create!(name: "user", email: "user@example.com",
                        password: "foobar10", password_confirmation: "foobar10")
    blog = user.blogs.create!(name: "Test Blog")
    @post = blog.posts.build(title: "Title", content: "Content")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "blog_id should be present" do
    @post.blog_id = nil
    assert_not @post.valid?
  end
end
