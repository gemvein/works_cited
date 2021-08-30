# frozen_string_literal: true

module WorksCited
  class Citation < ApplicationRecord
    validates_presence_of :type
    belongs_to :record, polymorphic: true
  end
end
