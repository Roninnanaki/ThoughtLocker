class PostsController < ApplicationController
  before_action :signed_in_user

  def new
    @post = Post.new
    @blog_hash = current_user.blogs.map { |blog| [blog.name, blog.id] }
  end

  def create
    @blog = Blog.find(params[:blog])
    @post = @blog.posts.build(post_params)
    if @post.save
      flash[:success] = "Posted!"
      redirect_to current_user
    else
      @blog_hash = current_user.blogs.map { |blog| [blog.name, blog.id] }
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :source, :photo)
  end
end
