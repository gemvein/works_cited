# frozen_string_literal: true

# Migration to create a second model to test with
class CreateThings < ActiveRecord::Migration[6.1]
  def change
    create_table :things do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
