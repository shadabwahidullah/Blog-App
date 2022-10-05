require 'rails_helper'

RSpec.describe 'Users index page', js: true , type: :system do
  describe 'shows all the users' do
    before(:each) do
      @user = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300', bio: 'web Developer from Afghanistan')
      @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author: @user)
      @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author: @user)
      @post3 = Post.create(title: 'Rspec test 3', text: 'this is the body of rspec test for post', author: @user)
      @comment1 = Comment.create(author: @user, post: @post1, text: 'this is the first comment' )
      @comment2 = Comment.create(author: @user, post: @post1, text: 'this is the second comment' )
      @comment3 = Comment.create(author: @user, post: @post1, text: 'this is the third comment' )
      @like1 = Like.create(author: @user, post: @post1)
      @like2 = Like.create(author: @user, post: @post1)
    end
    it 'loads the user profile picture' do
      visit user_posts_path(@user)
      expect(page).to have_xpath('//img[@src="https://via.placeholder.com/300"]')
    end
    it 'has all the users' do
      visit user_posts_path(@user)
      expect(page).to have_content(@user.name)
    end
    it 'shows the user post counters' do
      visit user_posts_path(@user)
      expect(page).to have_content('number of posts: 3')
    end
    it 'I should see a post title' do
      visit user_posts_path(@user)
      expect(page).to have_content('Rspec test 3')
    end
    it 'I should see a post body' do
      visit user_posts_path(@user)
      expect(page).to have_content('this is the body of')
    end
    it 'I should see a post body' do
      visit user_posts_path(@user)
      expect(page).to have_content('this is the body of')
    end
    it 'I should see the first comment for post1' do
      visit user_posts_path(@user)
      expect(page).to have_content('this is the first comment')
    end
    it 'I should see the number of comments' do
      visit user_posts_path(@user)
      expect(page).to have_content('Comments: 3')
    end
    it 'Should show how may likes a post have' do
      visit user_posts_path(@user)
      expect(page).to have_content('Likes: 2')
    end
    it 'When I click on a post, it redirects me to that posts show page' do
      visit user_posts_path(@user)
      click_link("post:#{@post2.id}")
      expect(page).to have_current_path(user_post_path(@user, @post))
    end
  end
end