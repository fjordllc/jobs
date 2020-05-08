# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tokens, as: :tokenizable, dependent: :destroy
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
