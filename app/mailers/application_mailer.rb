# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: '株式会社フィヨルド <info@fjord.jp>'
  layout 'mailer'
end
