# frozen_string_literal: true

class CreateDoodads < ActiveRecord::Migration[6.1]
  def change
    create_table :doodads do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
