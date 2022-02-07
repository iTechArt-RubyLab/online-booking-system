class ServicePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.salon_owner?
  end

  def update?
    user.salon_owner?
  end

  def destroy?
    user.salon_owner?
  end
end
