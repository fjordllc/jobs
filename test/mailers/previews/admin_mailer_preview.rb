# frozen_string_literal: true

class AdminMailerPreview < ActionMailer::Preview
  def login_link
    AdminMailer.login_link('foo@example.com', 'x' * 32)
  end
end
