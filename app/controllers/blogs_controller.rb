class BlogsController < ApplicationController
	before_filter :signed_in_user

	def index
		if params["query"]
		    @blogs = Blog.find(:all, :conditions => ['name LIKE ?', "%#{params["query"]}%"])
		  else
		    @blogs = Blog.find(:all)
		  end
	end
		
	def new
		@blog = Blog.new
	end
	
	def create 
		@blog = current_user.blogs.build(params[:blog])
		if @blog.save
			flash[:success] = "Blog created!"
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
	  		@tags += i.name + ", "
	  	end
	  end
	end
	
	def update
 	  @blog = Blog.find(params[:id])
      #@tag = @blog.tags.create(params[:tag])

      string = params[:tags_list]
      array = string.split(', ')

	  array.each do |tag|
		@blog.tags.find_or_create_by_name(tag)
	  end

	  if @blog.update_attributes(params[:user])
	    flash[:success] = "Blog updated!"
	    redirect_to current_user
	  else
	    render 'edit'
	  end 
	end
	
	def show
		@blog = Blog.find(params[:id])
	end
end
