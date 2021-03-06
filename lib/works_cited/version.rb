# frozen_string_literal: true

# WorksCited module
module WorksCited
  VERSION = File.read(File.expand_path('../../VERSION', __dir__))
  def self.version_string
    "WorksCited version #{WorksCited::VERSION}"
  end
end
