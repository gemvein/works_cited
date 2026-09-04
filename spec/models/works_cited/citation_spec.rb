# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksCited::Citation, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:citation_type) }
    it { should validate_presence_of(:record) }

    describe 'citation_type inclusion' do
      let(:doodad) { FactoryBot.create(:doodad) }
      let(:citation) { FactoryBot.build(:works_cited_citation, record: doodad, citation_type: 'not_a_real_type') }

      it 'names the invalid value and the allowed types in the error message' do
        citation.valid?
        expect(citation.errors[:citation_type]).to include(
          'not_a_real_type is not a valid citation type. Must be one of: ' \
          "#{WorksCited.configuration.valid_citation_types.to_sentence(last_word_connector: ', or ')}"
        )
      end
    end
  end

  describe 'Relationships' do
    it { should have_many(:works_cited_contributors) }
  end

  describe 'Instance Methods' do
    let(:doodad) { FactoryBot.create(:doodad) }
    let(:book) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'book') }
    let(:periodical) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'periodical') }
    let(:electronic) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'electronic') }
    let(:interview) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'interview') }
    let(:email) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'email') }
    describe '#works_cited_contributors_attributes=' do
      before do
        book.works_cited_contributors.destroy_all
      end
      it 'saves the contributors' do
        expect do
          contributor_attributes = FactoryBot.build(:works_cited_contributor).attributes
          book.works_cited_contributors_attributes = { "0" => contributor_attributes }
          book.save
        end.to change { book.works_cited_contributors.count }.by(1)
      end
    end
    describe '#book?' do
      describe 'when true' do
        subject { book.book? }
        it { should be(true) }
      end
      describe 'when false' do
        subject { periodical.book? }
        it { should be(false) }
      end
    end
    describe '#periodical?' do
      describe 'when true' do
        subject { periodical.periodical? }
        it { should be(true) }
      end
      describe 'when false' do
        subject { electronic.periodical? }
        it { should be(false) }
      end
    end
    describe '#electronic?' do
      describe 'when true' do
        subject { electronic.electronic? }
        it { should be(true) }
      end
      describe 'when false' do
        subject { interview.electronic? }
        it { should be(false) }
      end
    end
    describe '#interview?' do
      describe 'when true' do
        subject { interview.interview? }
        it { should be(true) }
      end
      describe 'when false' do
        subject { email.interview? }
        it { should be(false) }
      end
    end
    describe '#email?' do
      describe 'when true' do
        subject { email.email? }
        it { should be(true) }
      end
      describe 'when false' do
        subject { book.email? }
        it { should be(false) }
      end
    end
  end
end
