# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: "auth"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      redirect_to root_path, flash: { notice: 'ユーザー登録してログインしました。' }
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
