class Post < ActiveRecord::Base
	attr_accessible :title, :content, :source, :blog_id, :photo
	belongs_to :blog
	validates :blog_id, presence: true
	
	has_attached_file :photo, :styles => { :post_size => "500x500>" },
	  :url => "/assets/posts/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/posts/:id/:style/:basename.:extension"

    validates_attachment_size :photo, :less_than => 1.2.megabytes
    # validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/jpg']

	default_scope order: 'posts.created_at DESC'
end
