module BlogHelper
  def join_tags(post)
    blog.tags.map { |t| t.name }.join(", ")
  end
end
