# frozen_string_literal: true

require 'rails_helper'

describe 'WorksCited' do
  it 'should return correct version string' do
    WorksCited.version_string.should == "WorksCited version #{WorksCited::VERSION}"
  end
end
