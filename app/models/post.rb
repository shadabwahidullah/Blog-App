class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def self.update_counter(author_id)
    user = User.find(author_id)
    user.posts_counter = user.posts_counter ? user.posts_counter + 1 : 1
    user.save
  end

  def self.five_recent_comments(post_id)
    Comment.where(post_id: post_id).order(created_at: :desc).limit(5)
  end
end
