
class Api::AuthenticationController < ApplicationController
  require 'jwt'

  def login
    user = User.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
