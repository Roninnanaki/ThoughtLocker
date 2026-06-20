class Post < ApplicationRecord
  belongs_to :blog
  has_one_attached :photo

  validates :blog_id, presence: true

  scope :recent, -> { order(created_at: :desc) }
end
