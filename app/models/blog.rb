class Blog < ActiveRecord::Base
	attr_accessible :name
	
	validates :user_id, presence: true
	validates :name, presence: true, :length => { :maximum => 100 }
	
	belongs_to :user
	has_many :tags, dependent: :destroy
	
	accepts_nested_attributes_for :tags, :allow_destroy => true, 
		:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
	
	default_scope order: 'blogs.created_at DESC'
end
