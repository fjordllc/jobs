# frozen_string_literal: true

class NewTokenForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :tokenizable, :token

  attribute :tokenizable_id, :integer
  attribute :tokenizable_type, :string
  attribute :email, :string

  validates :email, presence: true
  validate :find_tokenizable!

  def save
    if valid?
      self.token = tokenizable.tokens.create
    else
      false
    end
  end

  def find_tokenizable!
    @tokenizable = tokenizable_class.find_by(email: email)
    if @tokenizable
      self.tokenizable_id = @tokenizable.id
    else
      errors[:base] << "#{tokenizable_type}が見つかりません。"
    end
  end

  private

  def tokenizable_class
    tokenizable_type.constantize
  end
end
