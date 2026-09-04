# frozen_string_literal: true

# This migration comes from works_cited (originally 20210831013102)

# Create Contributors
class CreateWorksCitedContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :works_cited_contributors do |t|
      t.references :works_cited_citation, null: false, foreign_key: true
      t.string :contributor_role
      t.string :first
      t.string :middle
      t.string :last
      t.string :suffix
      t.string :handle

      t.timestamps
    end
  end
end
