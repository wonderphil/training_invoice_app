require 'byebug'
module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      byebug
      if @user.save
        render :create
      else
        
        render json: { error: @user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end