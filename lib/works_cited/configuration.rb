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

  # Names of classes that have called `has_works_cited`, populated by the
  # mixin itself. Lets the citations controller build its record picker
  # without a blanket `Rails.application.eager_load!` on every request.
  def self.citable_classes
    @citable_classes ||= []
  end

  # WorksCited Configuration
  class Configuration
    attr_accessor(
      :valid_citation_types,
      :valid_contributor_roles
    )

    def initialize
      self.valid_citation_types = %w[book periodical electronic interview email tweet]
      self.valid_contributor_roles = %w[author editor compiler translator receiver]
    end
  end
end
