# frozen_string_literal: true

class CreateDoodadsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :doodads do |t|
      t.string :name
      t.text :description
    end
  end
end
