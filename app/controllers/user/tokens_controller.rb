# frozen_string_literal: true

class User::TokensController < ApplicationController
  layout 'auth'

  def new
    @new_token_form = NewTokenForm.new
  end

  def create
    @new_token_form = build_new_token_form
    if @new_token_form.save
      UserMailer.login_link(@new_token_form.email, @new_token_form.token.token).deliver
      redirect_to root_path, flash: { notice: 'ログインメールを送りました。' }
    else
      render :new
    end
  end

  private

  def new_token_form_params
    params.require(:new_token_form).permit(:email)
  end

  def build_new_token_form
    NewTokenForm.new(
      **new_token_form_params,
      tokenizable_type: 'User'
    )
  end
end
