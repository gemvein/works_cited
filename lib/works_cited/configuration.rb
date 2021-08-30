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
      :anonymous_customer_stripe_id,
      :anonymous_plan_stripe_id,
      :free_plan_stripe_id,
      :features
    )

    def initialize
      self.anonymous_customer_stripe_id = 'TODO'
      self.anonymous_plan_stripe_id = 'TODO'
      self.free_plan_stripe_id = 'TODO'
      self.features = {}
    end
  end
end
