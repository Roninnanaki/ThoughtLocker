class PostsController < ApplicationController
	def new 
	  @post = Post.new
	  @blog_hash = []
	  current_user.blogs.each do |blog|
	  	@blog_hash << [blog.name, blog.id]
	  end
	end
	
	def create 
	  @blog = Blog.find(params[:blog].to_s)
	  @post = @blog.posts.build(params[:post])
	  if @post.save
		flash[:success] = "Posted!"
		redirect_to current_user
	  else
		render 'new'
	  end
	end
	
	def show 
	  @post = Post.find(params[:id])
	end
end
