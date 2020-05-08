# frozen_string_literal: true

class CompanyMailerPreview < ActionMailer::Preview
  def login_link
    CompanyMailer.login_link('foo@example.com', 'x' * 32)
  end
end
