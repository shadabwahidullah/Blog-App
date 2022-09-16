require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Users should have a name ' do
    user = User.new( photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0);
    expect(user).to_not be_valid
  end

  it 'Posts_counter should be zero or greater than that' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'Posts_counter should be zero or greater than that' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    expect(user).to be_valid
  end

  it 'The last_three_posts method should return the last three posts' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    first_post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter:0)
    second_post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter:0)
    third_post = Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0, likes_counter:0)
    expect(user.last_three_posts.length).to be(3)
  end
end
  