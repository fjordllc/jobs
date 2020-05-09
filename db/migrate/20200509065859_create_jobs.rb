# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
