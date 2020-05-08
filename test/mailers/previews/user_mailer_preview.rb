# frozen_string_literal: true

class UserMailerPreview < ActionMailer::Preview
  def login_link
    UserMailer.login_link('foo@example.com', 'x' * 32)
  end
end
