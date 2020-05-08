# frozen_string_literal: true

class Token < ApplicationRecord
  belongs_to :tokenizable, polymorphic: true
  validates :token, :expires_at, presence: true
  after_initialize :set_default_values

  private

  def set_default_values
    self.token ||= TokenGenerator.generate
    self.expires_at ||= Time.current.since(1.hour)
  end
end
