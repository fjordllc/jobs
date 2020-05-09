# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :tokens, as: :tokenizable, dependent: :destroy
  has_many :jobs, dependent: :destroy
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
end
