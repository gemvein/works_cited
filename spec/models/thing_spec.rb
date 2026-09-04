# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Thing, type: :model do
  describe 'Mixin functioning' do
    it { should have_many(:works_cited_citations) }
  end
  describe 'WorksCited Methods' do
    describe '#works_cited_citations_attributes=' do
      let!(:thing) { FactoryBot.create(:thing) }
      it 'saves the citations' do
        expect do
          citation_attributes = FactoryBot.build(:works_cited_citation).attributes
          thing.works_cited_citations_attributes = { "0" => citation_attributes }
          thing.save
        end.to change { thing.works_cited_citations.count }.by(1)
      end
    end
  end
end
