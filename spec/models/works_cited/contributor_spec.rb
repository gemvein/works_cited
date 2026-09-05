# frozen_string_literal: true

require 'rails_helper'

module WorksCited
  RSpec.describe Contributor, type: :model do
    let(:doodad) { FactoryBot.create(:doodad) }
    let(:citation) { FactoryBot.create(:works_cited_citation, record: doodad) }

    describe 'Validations' do
      it { is_expected.to validate_presence_of(:contributor_role) }

      describe 'contributor_role inclusion' do
        let(:contributor) do
          FactoryBot.build(:works_cited_contributor, works_cited_citation: citation, contributor_role: 'not_a_role')
        end

        it 'names the invalid value and the allowed roles in the error message' do
          contributor.valid?
          expect(contributor.errors[:contributor_role]).to include(
            'not_a_role is not a valid contributor role. Must be one of: ' \
            "#{WorksCited.configuration.valid_contributor_roles.to_sentence(last_word_connector: ', or ')}"
          )
        end
      end
    end

    describe 'Relationships' do
      it { is_expected.to belong_to(:works_cited_citation) }
    end

    describe 'Scopes' do
      let!(:author) do
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'author'
        )
      end
      let!(:editor) do
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'editor'
        )
      end
      let!(:compiler) do
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'compiler'
        )
      end
      let!(:translator) do
        FactoryBot.create(
          :works_cited_contributor,
          works_cited_citation: citation,
          contributor_role: 'translator'
        )
      end

      describe '.authors' do
        subject { described_class.authors }
        it { is_expected.to include(author) }
        it { is_expected.not_to include(editor) }
        it { is_expected.not_to include(compiler) }
        it { is_expected.not_to include(translator) }
      end

      describe '.editors' do
        subject { described_class.editors }
        it { is_expected.not_to include(author) }
        it { is_expected.to include(editor) }
        it { is_expected.not_to include(compiler) }
        it { is_expected.not_to include(translator) }
      end

      describe '.compilers' do
        subject { described_class.compilers }
        it { is_expected.not_to include(author) }
        it { is_expected.not_to include(editor) }
        it { is_expected.to include(compiler) }
        it { is_expected.not_to include(translator) }
      end

      describe '.translators' do
        subject { described_class.translators }
        it { is_expected.not_to include(author) }
        it { is_expected.not_to include(editor) }
        it { is_expected.not_to include(compiler) }
        it { is_expected.to include(translator) }
      end
    end

    describe 'Instance Methods' do
      describe '#full_name' do
        let(:contributor) do
          FactoryBot.create(
            :works_cited_contributor,
            works_cited_citation: citation,
            first: 'Joseph',
            middle: 'James',
            last: 'Jackson',
            suffix: 'Jr.'
          )
        end

        describe 'with first' do
          subject { contributor.full_name(:first) }
          it { is_expected.to eq 'Joseph J Jackson, Jr.' }
        end

        describe 'with last' do
          subject { contributor.full_name(:last) }
          it { is_expected.to eq 'Jackson, Joseph J, Jr.' }
        end

        describe 'with a handle and a name' do
          let(:contributor) do
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              first: 'Joseph',
              middle: '',
              last: 'Jackson',
              suffix: '',
              handle: 'jjackson'
            )
          end

          subject { contributor.full_name }
          it { is_expected.to eq 'jjackson [Joseph Jackson]' }
        end

        describe 'with a handle and no name' do
          let(:contributor) do
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              first: '',
              middle: '',
              last: '',
              suffix: '',
              handle: 'Carl'
            )
          end

          subject { contributor.full_name }
          it { is_expected.to eq 'Carl' }
        end
      end
    end
  end
end
