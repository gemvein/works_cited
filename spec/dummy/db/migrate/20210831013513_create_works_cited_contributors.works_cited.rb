# This migration comes from works_cited (originally 20210831013102)
class CreateWorksCitedContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :works_cited_contributors do |t|
      t.references :works_cited_citation, null: false, foreign_key: true
      t.string :role
      t.string :first
      t.string :middle
      t.string :last
      t.string :suffix

      t.timestamps
    end
  end
end
