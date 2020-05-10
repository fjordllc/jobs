# frozen_string_literal: true

require 'active_support'

module EmailLogin
  mattr_accessor(:targets) { %w[User] }

  def self.classes
    @@targets.map(&:constantize)
  end
end

# EmailLogin.targets = %w[User]
EmailLogin.targets = %w[Admin Company User]
