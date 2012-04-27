class Post < ActiveRecord::Base
	attr_accessible :title, :content, :source, :blog_id
	has_one :photos, dependent: :destroy
	belongs_to :blog
	validates :blog_id, presence: true
	
	default_scope order: 'posts.created_at DESC'
end
