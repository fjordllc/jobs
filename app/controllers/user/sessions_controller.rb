# frozen_string_literal: true

class User::SessionsController < ApplicationController
  before_action :set_token, only: :create

  def create
    if @token
      sign_in @token.tokenizable
      redirect_to root_path, flash: { notice: 'ログインしました。' }
    else
      redirect_to root_path, flash: { notice: 'ログインできませんでした。' }
    end
  end

  def destroy
    sign_out User
    redirect_to root_path, flash: { notice: 'ログアウトしました。' }
  end

  private

  def set_token
    @token = Token.find_by(
      tokenizable_type: 'User',
      token: params[:token],
      expires_at: Time.current..Float::INFINITY
    )
  end
end
