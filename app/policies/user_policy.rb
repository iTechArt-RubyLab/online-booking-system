class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.salon_owner?
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

  def search?
    #user.id = current_user.id?  /true
  end
end
