# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def login_link(email, token)
    @url = user_sign_in_url(token: token)
    mail to: email, subject: '[fjord jobs] ログインメール'
  end
end
