class BlogsController < ApplicationController
  before_action :signed_in_user

  def index
    @blogs = if params[:query].present?
               Blog.where("name LIKE ?", "%#{Blog.sanitize_sql_like(params[:query])}%")
             else
               Blog.recent
             end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:success] = "Blog created!"
      redirect_to current_user
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @tags = @blog.tags.map(&:name).join(", ")
  end

  def update
    @blog = Blog.find(params[:id])

    if params[:tags_list].present?
      params[:tags_list].split(", ").each do |tag_name|
        @blog.tags.find_or_create_by(name: tag_name)
      end
    end

    if @blog.update(blog_params)
      flash[:success] = "Blog updated!"
      redirect_to current_user
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  private

  def blog_params
    params.require(:blog).permit(:name, tags_attributes: [:id, :name, :_destroy])
  end
end
