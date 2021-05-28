require 'rails_helper'

RSpec.describe '/adminpanel', type: :request do
  fixtures :users

  let(:valid_attributes) {
    {email: 'example2@example.com', username: 'example', password: 'dhsjhgd67', user_type: 'administrator'}
  }

  before(:each) do
    user = User.create!(email: 'test@example.com', username: 'test', password: 'f4k3p455w0rd', user_type: 'administrator')
    user.confirm
    login_as(user, scope: :user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      users = User.create! valid_attributes
      get adminpanel_index_url(users)
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      users = User.create! valid_attributes
      get edit_adminpanel_path(users)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        { user_id: users(:one).id, username: 'example', user_type: 'user' }
      }

      it 'updates the requested user' do
        user = User.create! valid_attributes
        patch adminpanel_url(user), params: { user: new_attributes }
        user.reload
      end

      it 'redirects to the users' do
        user = User.create! valid_attributes
        patch adminpanel_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(adminpanel_index_url)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested users' do
      user = User.create! valid_attributes
      expect {
        delete adminpanel_url(user)
      }.to change(User, :count).by(-1)
    end

    it 'redirects to the user list' do
      user = User.create! valid_attributes
      delete adminpanel_url(user)
      expect(response).to redirect_to(adminpanel_url)
    end
  end
end
