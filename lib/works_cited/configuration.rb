# frozen_string_literal: true

# WorksCited Module
module WorksCited
  def self.configure(configuration = WorksCited::Configuration.new)
    block_given? && yield(configuration)
    @configuration = configuration
  end

  def self.configuration
    @configuration ||= WorksCited::Configuration.new
  end

  # WorksCited Configuration
  class Configuration
    attr_accessor(
      :valid_record_types,
      :valid_citation_types,
      :valid_contributor_roles,
    )

    def initialize
      self.valid_record_types = []
      self.valid_citation_types = %w[book periodical electronic interview email tweet]
      self.valid_contributor_roles = %w[author editor compiler translator receiver]
    end
  end
end
