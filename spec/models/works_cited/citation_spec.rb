# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WorksCited::Citation, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:type) }
  end

  describe 'Relationships' do
    it { should have_many(:works_cited_contributors) }
  end
end
