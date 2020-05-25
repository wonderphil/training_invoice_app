module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)

      if @user.save
        jwt = JWT.encode(
          { user_id: user.id, exp: (Time.now + 2.weeks).to_i },
          Rails.application.secrets.secret_key_base,
          'HS256'
        )
        render :create, locals: { token: jwt }, status: :created 
      else
        head(:unprocessable_entity)
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

  end
end