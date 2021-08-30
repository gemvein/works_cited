require 'rails_helper'

RSpec.describe Doodad, type: :model do
  describe 'Gem functioning' do
    it { should have_many(:works_cited_citations) }
  end
end
