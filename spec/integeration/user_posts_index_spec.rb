require 'rails_helper'

RSpec.describe 'Users index page', js: true , type: :system do
  describe 'shows all the users' do
    before(:each) do
      @user = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300', bio: 'web Developer from Afghanistan')
      @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author: @user)
      @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author: @user)
      @post3 = Post.create(title: 'Rspec test 3', text: 'this is the body of rspec test for post', author: @user)
      # @comment1 = Comment.create(author: @user, post: )
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
  end
end