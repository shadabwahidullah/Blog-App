require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'The counter should increment' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                    posts_counter: 0)
    post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    like = Like.create(author: user, post: post)
    like.update_likes_counter

    expect(post.likes_counter).to be(1)
  end
end
