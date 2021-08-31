require 'rails_helper'

describe WorksCited::WorksCitedHelper do
  let(:doodad) do
    FactoryBot.create(:doodad)
  end

  describe '#works_cited' do
    before do
      FactoryBot.create_list(:works_cited_citation, 15, record: doodad, contributors_count: [*1..3].sample)
    end

    context 'returns list' do
      subject { helper.works_cited(doodad) }
      it do
        should have_tag('ul', with: { class: 'citations' }) do
          with_tag(
            'li',
            with: { class: 'citation' }
          )
        end
      end
    end
  end
end