require 'rails_helper'

RSpec.describe 'Users index page', js: true , type: :system do
  describe 'shows all the users' do
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
  end
end