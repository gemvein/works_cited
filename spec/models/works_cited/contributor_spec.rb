require 'rails_helper'

module WorksCited
  RSpec.describe Contributor, type: :model do
    describe 'Validations' do
      it { should validate_presence_of(:works_cited_citation) }
      it { should validate_presence_of(:contributor_role) }
    end
    describe 'Relationships' do
      it { should belong_to(:works_cited_citation) }
    end
  end
end
