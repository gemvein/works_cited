# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :list, WorksCited::Citation
    can :list, WorksCited::Contributor

    return if user.new_record? # Anonymous Users leave

    can :read, WorksCited::Citation
    can :read, WorksCited::Contributor
    # # We could have other rules in here, like:
    # can :manage, WorksCited::Citation, record: { user_id: user.id }
    # can :manage, WorksCited::Contributor, record: { user_id: user.id }

    return unless user.admin? # Non Admin Users leave

    can :select, Doodad
    can :manage, WorksCited::Citation
    can :manage, WorksCited::Contributor
  end
end
