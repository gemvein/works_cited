# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksCited::Citation, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:citation_type) }

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
    it { is_expected.to have_many(:works_cited_contributors) }
    it { is_expected.to belong_to(:record) }
  end

  describe 'Instance Methods' do
    let(:doodad) { FactoryBot.create(:doodad) }
    let(:book) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'book') }

    let(:email) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'email') }
    let(:interview) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'interview') }
    let(:electronic) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'electronic') }
    let(:periodical) { FactoryBot.create(:works_cited_citation, record: doodad, citation_type: 'periodical') }

    describe '#record=' do
      subject(:citation) { described_class.new }

      it 'sets the record when given a citable class in "Model:id" form' do
        citation.record = "#{doodad.class.name}:#{doodad.id}"
        expect(citation.record).to eq(doodad)
      end

      it 'leaves record unset for a class that never called has_works_cited' do
        user = FactoryBot.create(:user)
        citation.record = "User:#{user.id}"
        expect(citation.record).to be_nil
      end

      it 'leaves record unset for a garbage class name' do
        citation.record = 'DefinitelyNotARealConstant:1'
        expect(citation.record).to be_nil
      end
    end

    describe '#works_cited_contributors_attributes=' do
      before do
        book.works_cited_contributors.destroy_all
      end

      it 'saves the contributors' do
        expect do
          contributor_attributes = FactoryBot.build(:works_cited_contributor).attributes
          book.works_cited_contributors_attributes = { '0' => contributor_attributes }
          book.save
        end.to change { book.works_cited_contributors.count }.by(1)
      end
    end

    describe '#book?' do
      describe 'when true' do
        subject { book.book? }

        it { is_expected.to be(true) }
      end

      describe 'when false' do
        subject { periodical.book? }

        it { is_expected.to be(false) }
      end
    end

    describe '#periodical?' do
      describe 'when true' do
        subject { periodical.periodical? }

        it { is_expected.to be(true) }
      end

      describe 'when false' do
        subject { electronic.periodical? }

        it { is_expected.to be(false) }
      end
    end

    describe '#electronic?' do
      describe 'when true' do
        subject { electronic.electronic? }

        it { is_expected.to be(true) }
      end

      describe 'when false' do
        subject { interview.electronic? }

        it { is_expected.to be(false) }
      end
    end

    describe '#interview?' do
      describe 'when true' do
        subject { interview.interview? }

        it { is_expected.to be(true) }
      end

      describe 'when false' do
        subject { email.interview? }

        it { is_expected.to be(false) }
      end
    end

    describe '#email?' do
      describe 'when true' do
        subject { email.email? }

        it { is_expected.to be(true) }
      end

      describe 'when false' do
        subject { book.email? }

        it { is_expected.to be(false) }
      end
    end
  end
end
