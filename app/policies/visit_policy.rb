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

  def approve?
    user.professional?
  end

  def reject_by_user?
    user.professional?
  end

  def reject_by_client?
    user.professional?
  end

  def finish?
    user.professional?
  end

  private

  def visit_creators?
    user.salon_owner? || user.professional?
  end
end
