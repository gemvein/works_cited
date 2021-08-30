require 'rails_helper'

RSpec.describe WorksCited::Citation, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:type) }
  end
end
