require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Update_comments_counter should update comments_counter for a post' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    posts_counter: 0)
    post = Post.new(author: user, title: 'test', text: 'This is my first post', comments_counter: 0, likes_counter: 0)
    comment = Comment.new(post: post, author: user, text: 'Hi Tom!')
    comment.update_comments_counter
    expect(post.comments_counter).to be(1)
  end
end
