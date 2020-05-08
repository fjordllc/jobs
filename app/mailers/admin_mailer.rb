# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def login_link(email, token)
    @url = admin_sign_in_url(token: token)
    mail to: email, subject: '[fjord jobs] ログインメール'
  end
end
