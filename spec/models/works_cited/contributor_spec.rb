require 'rails_helper'

module WorksCited
  RSpec.describe Contributor, type: :model do
    let(:doodad) { FactoryBot.create(:doodad) }
    let(:citation) { FactoryBot.create(:works_cited_citation, record: doodad) }

    describe 'Validations' do
      it { should validate_presence_of(:works_cited_citation) }
      it { should validate_presence_of(:contributor_role) }
    end

    describe 'Relationships' do
      it { should belong_to(:works_cited_citation) }
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
        subject { WorksCited::Contributor.authors }
        it { should include(author) }
        it { should_not include(editor) }
        it { should_not include(compiler) }
        it { should_not include(translator) }
      end
      describe '.editors' do
        subject { WorksCited::Contributor.editors }
        it { should_not include(author) }
        it { should include(editor) }
        it { should_not include(compiler) }
        it { should_not include(translator) }
      end
      describe '.compilers' do
        subject { WorksCited::Contributor.compilers }
        it { should_not include(author) }
        it { should_not include(editor) }
        it { should include(compiler) }
        it { should_not include(translator) }
      end
      describe '.translators' do
        subject { WorksCited::Contributor.translators }
        it { should_not include(author) }
        it { should_not include(editor) }
        it { should_not include(compiler) }
        it { should include(translator) }
      end
    end

    describe 'Class Methods' do
      describe '.list_names' do
        describe 'with one name' do
          before do
            citation.works_cited_contributors.authors.destroy_all
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Joseph',
              middle: 'James',
              last: 'Jackson',
              suffix: 'Jr.'
            )
          end
          subject { citation.works_cited_contributors.authors.list_names }
          it { should eq 'Jackson, Joseph J, Jr.' }
        end
        describe 'with two names' do
          before do
            citation.works_cited_contributors.authors.destroy_all
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Joseph',
              middle: 'James',
              last: 'Jackson',
              suffix: 'Jr.'
            )
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Susan',
              middle: 'Sara',
              last: 'Sorenson',
              suffix: 'Sr.'
            )
          end
          subject { citation.works_cited_contributors.authors.list_names }
          it { should eq 'Jackson, Joseph J, Jr., and Susan S Sorenson, Sr.' }
        end
        describe 'with more names' do
          before do
            citation.works_cited_contributors.authors.destroy_all
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Joseph',
              middle: 'James',
              last: 'Jackson',
              suffix: 'Jr.'
            )
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Susan',
              middle: 'Sara',
              last: 'Sorenson',
              suffix: 'Sr.'
            )
            FactoryBot.create(
              :works_cited_contributor,
              works_cited_citation: citation,
              contributor_role: 'author',
              first: 'Lara',
              middle: '',
              last: 'Lovelace',
              suffix: ''
            )
          end
          subject { citation.works_cited_contributors.authors.list_names }
          it { should eq 'Jackson, Joseph J, Jr., et al' }
        end
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
          it { should eq 'Joseph J Jackson, Jr.' }
        end
        describe 'with last' do
          subject { contributor.full_name(:last) }
          it { should eq 'Jackson, Joseph J, Jr.' }
        end
      end
    end
  end
end
