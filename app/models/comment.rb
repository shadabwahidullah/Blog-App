class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_comments_counter(post_id)
    post = Post.find(post_id)
    post.comments_counter = post.comments_counter ? post.comments_counter + 1 : 1
    post.save
  end
end
