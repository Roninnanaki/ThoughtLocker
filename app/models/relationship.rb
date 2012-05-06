class Relationship < ActiveRecord::Base
  attr_accessible :followed_blog_id

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "Blog"

  validates :follower_id, presence: true
  validates :followed_blog_id, presence: true
end
