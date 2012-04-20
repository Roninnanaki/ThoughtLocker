class BlogsController < ApplicationController
	before_filter :signed_in_user

	def new
		@blog = Blog.new
	end
	
	def create 
		@blog = current_user.blogs.build(params[:blog])
		if @blog.save
			flash[:success] = "Blog created! Add <a href=\"tags/new\">tags</a>?"
			redirect_to current_user
		else
			render 'new'
		end
	end
	
	def edit
	  @blog = Blog.find(params[:id])
	end
	
	def update
		@blog = Blog.find(params[:id])
		test = params[:tag].to_s
		puts "\n\n\nhi\n\n\n" + test
	    if @blog.update_attributes(params[:user])
	      flash[:success] = "Blog updated!"
	      redirect_to current_user
	    else
	      render 'edit'
	    end 
	end
end
