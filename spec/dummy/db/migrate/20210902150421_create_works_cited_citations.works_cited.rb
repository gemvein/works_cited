# frozen_string_literal: true
# This migration comes from works_cited (originally 20210830165845)

# This migration creates the citations table for works_cited
class CreateWorksCitedCitations < ActiveRecord::Migration[6.1]
  # rubocop:disable Metrics/AbcSize
  def change
    create_table :works_cited_citations do |t|
      t.string :citation_type
      t.string :media
      t.string :title
      t.string :container_title
      t.string :publisher
      t.string :city
      t.string :edition
      t.string :volume
      t.string :number
      t.string :series
      t.string :year
      t.string :pages
      t.string :url
      t.string :online_database
      t.string :doi
      t.timestamp :published_at
      t.timestamp :accessed_at
      t.references :record, polymorphic: true, null: false

      t.timestamps
    end
  end
  # rubocop:enable Metrics/AbcSize
end
