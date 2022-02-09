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

  def go_to_vacation?
    user.salon_owner?
  end

  def ban?
    user.salon_owner?
  end

  def fire?
    user.salon_owner?
  end
end
