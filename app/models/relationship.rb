class Relationship < ApplicationRecord
  belongs_to :followed, class_name: "Blog", foreign_key: "followed_blog_id"
  belongs_to :follower, class_name: "User", foreign_key: "follower_id"
end
