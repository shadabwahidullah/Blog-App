require 'rails_helper'

RSpec.describe 'Users index page', js: true , type: :system do
  describe 'show a user profile' do
    before(:each) do
      @user = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300', bio: 'web Developer from Afghanistan')
      @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author: @user)
      @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author: @user)
      @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author: @user)
    end
    it 'I can the user profile picture' do
      visit user_path(@user)
      expect(page).to have_xpath('//img[@src="https://via.placeholder.com/300"]')
    end
    it 'I can see user\'s username\\' do
      visit user_path(@user)
      expect(page).to have_content(@user.name)
    end
    it 'I can see the user bio' do
      visit user_path(@user)
      expect(page).to have_content(@user.bio)
    end
    it 'I can see the number of posts the user has written.' do
      visit user_path(@user)
      expect(page).to have_content(@user.posts_counter)
    end
    it 'I can see a button to see all the posts' do
      visit user_path(@user)
      expect(page).to have_selector(:link_or_button, 'See all posts')
    end
    it 'When I click on a post it redirects me to that post show page' do
      visit user_path(@user)
      click_on("post:#{@post1.id}")
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
    it 'When I click on see all posts it redirects me to users post index page' do
      visit user_path(@user)
      click_button('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end