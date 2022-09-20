require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) { get user_posts_path user_id: 2 }

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('this should list all Posts')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_post_path user_id: 2, id: 1 }

    it 'is success ' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'Contains the placeholder text' do
      expect(response.body).to match('this should show a specific post for a user')
    end
  end
end
