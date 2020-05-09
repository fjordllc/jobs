# frozen_string_literal: true

class Job < ApplicationRecord
  belongs_to :company
  validates :title, :description, presence: true
end
