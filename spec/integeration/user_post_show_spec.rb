require 'rails_helper'

RSpec.describe 'Users index page', js: true, type: :system do
  describe 'shows post with details' do
    before(:each) do
      @user = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300',
                          bio: 'web Developer from Afghanistan')
      @user2 = User.create(name: 'Abdul', photo: 'https://via.placeholder.com/300',
                           bio: 'web Developer from Afghanistan')
      @post = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author: @user)
      @comment1 = Comment.create(author: @user, post: @post, text: 'this is the first comment')
      @comment2 = Comment.create(author: @user, post: @post, text: 'this is the second comment')
      @comment3 = Comment.create(author: @user2, post: @post, text: 'This is a comment from Abdul')
      @like1 = Like.create(author: @user, post: @post)
      @like2 = Like.create(author: @user, post: @post)
    end
    it 'I can see the posts title' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Rspec test 1')
    end
    it 'I can see who wrote the post.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content(@user.name)
    end
    it 'I can see how many comments it has' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('comments: 3')
    end
    it 'I can see how many likes it has.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('likes: 2')
    end
    it 'I can see the post body.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('rspec test for post')
    end
    it 'I can see the username of each commentor.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('Ahmad')
      expect(page).to have_content('Abdul')
    end
    it 'I can see the comment each commentor left.' do
      visit user_post_path(@user, @post)
      expect(page).to have_content('this is the first comment')
      expect(page).to have_content('This is a comment from Abdul')
    end
  end
end
