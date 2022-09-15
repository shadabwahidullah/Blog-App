class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def self.last_three_posts(user_id)
    Post.where(author_id: user_id).order(created_at: :desc).limit(3)
  end
end
