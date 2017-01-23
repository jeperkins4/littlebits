class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can [:read, :new, :create], :all
      can :manage, user.inventions
    end
  end
end
