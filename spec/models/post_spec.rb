require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Title should not be blank' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, text: 'This is my first post', comments_counter: 0, likes_counter:0)

    expect(post).to_not be_valid
  end

  it 'Title should not be blank' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: '', text: 'This is my first post', comments_counter: 0, likes_counter:0)

    expect(post).to_not be_valid
  end

  it 'Title should not be more than 255 chars' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: 'e'*300, text: 'This is my first post', comments_counter: 0, likes_counter:0)

    expect(post).to_not be_valid
  end

  it 'Comments_counter should be greater than or equal zero' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: 'test', text: 'This is my first post', comments_counter: -1, likes_counter:0)

    expect(post).to_not be_valid
  end

  it 'Likes_counter should be greater than or equal zero' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: 'test', text: 'This is my first post', comments_counter: 0, likes_counter:-1)

    expect(post).to_not be_valid
  end

  it 'Update_posts_counter should increment posts_counter for the user' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: 'test', text: 'This is my first post', comments_counter: 0, likes_counter:0)
    post.update_posts_counter

    expect(user.posts_counter).to be(1)
  end

  it 'Five_recent_comments should return the last five comments for a post' do
    user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    post = Post.new(author: user, title: 'test', text: 'This is my first post', comments_counter: 0, likes_counter:0)
    
    Comment.create(post: post, author: user, text: 'Hi Tom!' )
    Comment.create(post: post, author: user, text: 'Hi Tom!' )
    Comment.create(post: post, author: user, text: 'Hi Tom!' )
    Comment.create(post: post, author: user, text: 'Hi Tom!' )
    Comment.create(post: post, author: user, text: 'Hi Tom!' )
    Comment.create(post: post, author: user, text: 'Hi Tom!' )

    expect(post.five_recent_comments.length).to be(5)
  end
end
