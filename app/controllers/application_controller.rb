class ApplicationController < ActionController::API
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    decoded_token = decode_token
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  def decode_token
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ')[1] if auth_header
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end
end