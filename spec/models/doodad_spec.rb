# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Doodad, type: :model do
  describe 'Mixin functioning' do
    it { should have_many(:works_cited_citations) }
  end
  describe 'WorksCited Methods' do
    describe '#works_cited_citations_attributes=' do
      let!(:doodad) { FactoryBot.create(:doodad) }
      it 'saves the citations' do
        expect do
          citation_attributes = FactoryBot.build(:works_cited_citation).attributes
          doodad.works_cited_citations_attributes = { "0" => citation_attributes }
          doodad.save
        end.to change { doodad.works_cited_citations.count }.by(1)
      end
    end
  end
end
