require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      @user = User.create(name: 'Ahmad', photo: 'sodome/png', bio: 'web Developer from Ethiopia')
      @post = Post.create(author: @user, title: 'test', text: 'A test post')
      @post2 = Post.create(author: @user, title: 'test2', text: 'A test post')
      get user_posts_path user_id: @user
    end

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('Posts')
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = User.create(name: 'John', photo: 'sodome/png', bio: 'web Developer from Ethiopia')
      @post = Post.create(author: @user, title: 'test', text: 'A test post')
      get user_post_path user_id: @user, id: @post
    end

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('John')
    end
  end
end
