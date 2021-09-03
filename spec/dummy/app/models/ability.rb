# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :show, WorksCited::Citation
    can :show, WorksCited::Contributor

    return if user.new_record? # Anonymous Users leave

    # # We could have other rules in here, like:
    # can :manage, WorksCited::Citation, record: { user_id: user.id }
    # can :manage, WorksCited::Contributor, record: { user_id: user.id }

    return unless user.admin? # Non Admin Users leave

    can :select, Doodad
    can :manage, WorksCited::Citation
    can :manage, WorksCited::Contributor
  end
end
