class Ability
  include CanCan::Ability

  def initialize(user)
#      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, Customer
        cannot :index, Customer
        cannot :show, Customer
        can :new, AddressServey
        can :create, AddressServey
        cannot :users, Customer
        can :manage, Tab, :id => user.tab.id
      end
  end
end
