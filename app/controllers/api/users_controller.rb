class Api::UsersController < ApplicationController
  def register
    user = User.new(user_params)

    if user.save
      render json: user, status: 201
    else
      render json: { error: user.errors.full_messages }
    end
  end

  private

  def user_params
    params.permit(:name, :email, :role, :password)
  end
end
