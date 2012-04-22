class Tag < ActiveRecord::Base
	attr_accessible :tag_name
	belongs_to :blog
	validates :blog_id, :presence => true
end
