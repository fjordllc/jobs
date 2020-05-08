# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :tokens do |t|
      t.references :tokenizable, polymorphic: true, null: false
      t.datetime :expires_at, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
