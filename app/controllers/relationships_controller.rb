class RelationshipsController < ApplicationController
  before_filter :signed_in_user

  def create
    @blog = Blog.find(params[:relationship][:followed_blog_id])
    puts "HEY IM HERE..." + @blog.id.to_s + " " + @blog.name
    current_user.follow!(@blog)
    redirect_to @blog
  end

  def destroy
    @blog = Relationship.find(params[:id]).followed
    current_user.unfollow!(@blog)
    redirect_to @blog
  end
end
