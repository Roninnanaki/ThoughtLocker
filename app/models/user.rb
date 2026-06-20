class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :relationships, foreign_key: "followed_blog_id", dependent: :destroy
  has_many :followed_blogs, through: :relationships, source: :followed

  has_secure_password

  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def following?(blog)
    relationships.find_by(followed_blog_id: blog.id)
  end

  def follow!(blog)
    relationships.create!(follower_id: id, followed_blog_id: blog.id)
  end

  def unfollow!(blog)
    relationships.find_by(followed_blog_id: blog.id)&.destroy
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.base64
  end
end
