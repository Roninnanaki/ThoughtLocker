class Tag < ActiveRecord::Base
	attr_accessible :name
	belongs_to :blog
	validates :blog_id, :presence => true
	validates :name, :presence => true, :length => {:minimum => 3}
end
