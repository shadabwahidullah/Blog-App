require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get users_path }
    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('users')
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'sodome/png', bio: 'web Developer from Ethiopia')
      get user_path id:@user
    end

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('user')
    end
  end
end
