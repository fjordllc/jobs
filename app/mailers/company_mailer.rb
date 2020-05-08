# frozen_string_literal: true

class CompanyMailer < ApplicationMailer
  def login_link(email, token)
    @url = company_sign_in_url(token: token)
    mail to: email, subject: '[fjord jobs] ログインメール'
  end
end
