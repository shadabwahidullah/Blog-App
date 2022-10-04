require 'rails_helper'

RSpec.describe 'Users index page', js: true , type: :system do
  describe 'shows all the users' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'https://via.placeholder.com/150', bio: 'web Developer from Ethiopia')
      @user2 = User.create(name: 'Ahmad', photo: 'https://via.placeholder.com/300', bio: 'web Developer from Afghanistan')
    end
    it 'has all the users' do
      visit users_path
      expect(page).to have_content('Ahmad')
    end
    it 'loads the user picture' do
      visit users_path
      expect(page).to have_xpath('//img[@src="https://via.placeholder.com/300"]')
    end
  end
end