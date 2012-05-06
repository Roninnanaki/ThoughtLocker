class Blog < ActiveRecord::Base
	attr_accessible :name, :tags_attributes, :id
	
	validates :user_id, presence: true
	validates :name, presence: true, :length => { :maximum => 100 }
	
	belongs_to :user
	has_many :tags, dependent: :destroy
	has_many :posts, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id"
	
	accepts_nested_attributes_for :tags, :allow_destroy => true
	
	default_scope order: 'blogs.created_at DESC'
end
