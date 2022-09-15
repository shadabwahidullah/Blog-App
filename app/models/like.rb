class Like < ApplicationRecord
  belongs_to :post
  belongs_to :comment

  def self.update_likes_counter (post_id)
    post = Post.find(post_id)
    post.likes_counter = post.likes_counter ? post.likes_counter + 1 : 1
    post.save
  end

end
