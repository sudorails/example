class Ability
  include CanCan::Ability

  def initialize(user)
#      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.tab?
        can :read, :all
        can :create, Customer
        cannot :index, Customer
        cannot :show, Customer
        can :new, AddressServey
        can :create, AddressServey
        cannot :users, Customer
        can :show, Tab, :id => user.tab.id
        cannot :manage, Tab
      end
  end
end
