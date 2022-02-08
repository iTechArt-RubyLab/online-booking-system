class VisitPolicy < ApplicationPolicy
  def index?
    visit_creators?
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  private

  def visit_creators?
    user.salon_owner? || user.professional? || client.id == current_user.id
  end
end
