# frozen_string_literal: true

# This migration comes from works_cited (originally 20210915160902)
class AddIndexToWorksCitedContributors < ActiveRecord::Migration[6.1]
  def change
    add_index :works_cited_contributors, %i[last first middle suffix handle], name: :index_citation_name,
                                                                              length: 100
  end
end
