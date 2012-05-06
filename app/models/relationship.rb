class Relationship < ActiveRecord::Base
  attr_accessible :followed_blog_id, :follower_id

  belongs_to :followed, class_name: "Blog"
  belongs_to :follower, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_blog_id, presence: true
end
