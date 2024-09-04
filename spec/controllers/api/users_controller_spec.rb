require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'POST #register' do
    context 'with valid attributes' do
      let(:valid_attributes) do
        {
          name: 'Chandan kumar',
          email: 'chandan.kumar@example.com',
          role: 'member',
          password: 'password123'
        }
      end

      it 'creates a new user' do
        post :register, params: valid_attributes
        expect(response).to have_http_status(201)
        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq('Chandan kumar')
        expect(json_response['role']).to eq('member')
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) do
        {
          name: '',
          email: 'abc@xyz.com',
          password: 'Password'
        }
      end

      it 'does not create a new user' do
        expect do
          post :register, params: invalid_attributes
        end.to_not change(User, :count)
      end
    end
  end
end
