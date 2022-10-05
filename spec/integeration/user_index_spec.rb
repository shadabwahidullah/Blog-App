require 'rails_helper'

RSpec.describe 'Users index page', js: true, type: :system do
  describe 'shows all the users' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://via.placeholder.com/150', bio: 'web Developer from Ethiopia')
      @user2 = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300',
                           bio: 'web Developer from Afghanistan')
      @post1 = Post.create(title: 'Rspec test 1', text: 'rspec test for post', author: @user2)
      @post2 = Post.create(title: 'Rspec test 2', text: 'rspec test for post', author: @user2)
      @post3 = Post.create(title: 'Rspec test 3', text: 'rspec test for post', author: @user2)
    end
    it 'has all the users' do
      visit users_path
      expect(page).to have_content('Ahmad')
    end
    it 'loads the user picture' do
      visit users_path
      expect(page).to have_xpath('//img[@src="https://via.placeholder.com/300"]')
    end
    it 'shows the user post counters' do
      visit users_path
      expect(page).to have_content('number of posts: 3')
    end
    it 'redirects to users show page' do
      visit users_path
      click_on(@user.id)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
