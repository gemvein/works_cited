# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Thing, type: :model do
  describe 'Gem functioning' do
    it { should have_many(:works_cited_citations) }
  end
end
