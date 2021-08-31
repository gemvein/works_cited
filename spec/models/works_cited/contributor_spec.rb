require 'rails_helper'

module WorksCited
  RSpec.describe Contributor, type: :model do
    describe 'Relationships' do
      it { should belong_to(:works_cited_citation) }
    end
  end
end
