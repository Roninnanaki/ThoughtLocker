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
	  @tags = ""
	  if !@blog.tags.nil?
	  	@blog.tags.each do |i|
	  		@tags += i.tag_name + ", "
	  	end
	  end
	end
	
	def update
 	  @blog = Blog.find(params[:id])
      #@tag = @blog.tags.create(params[:tag])

      string = params[:tags_list]
      array = string.split(', ')
      puts "\n\n\n\n::::::::::::HEY FIND ME " + array.to_s
      
      # array.each do |tag|
#       	if !@blogs.tags.nil?
#       		@blog.tags.each do |i|
#       			if !i == tag
#       				@blog.tags.build(:tag_name => tag).save
#       			end
#       		end
#       	else
#       		@blog.tags.build(:tag_name => tag).save
#       	end
#       end

		array.each do |tag|
			@blog.tags.build(:tag_name => tag).save
		end

	  if @blog.update_attributes(params[:user])
	    flash[:success] = "Blog updated!"
	    redirect_to current_user
	  else
	    render 'edit'
	  end 
	end
end
