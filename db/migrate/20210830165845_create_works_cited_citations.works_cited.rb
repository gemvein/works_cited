# frozen_string_literal: true

# This migration creates the citations table for works_cited
class CreateWorksCitedCitations < ActiveRecord::Migration[6.1]
  def change
    create_table :works_cited_citations do |t|
      t.string :citation_type
      t.string :media
      t.string :title
      t.string :publisher
      t.string :city
      t.integer :edition
      t.integer :volume
      t.string :series
      t.integer :year
      t.references :record, polymorphic: true, null: false

      t.timestamps
    end
  end
end
