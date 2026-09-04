# frozen_string_literal: true

require 'rails_helper'

describe 'WorksCited' do
  it 'returns the correct version string' do
    expect(WorksCited.version_string).to eq("WorksCited version #{WorksCited::VERSION}")
  end
end
