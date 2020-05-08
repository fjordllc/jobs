# frozen_string_literal: true

class TokenGenerator
  def self.generate
    SecureRandom.urlsafe_base64(32)
  end
end
