class CategoryPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    owner_abilities?
  end

  def update?
    owner_abilities?|| current_user.professional?
  end

  def destroy?
    owner_abilities?
  end

  private

  def owner_abilities?
    current_user.salon_owner?
  end
end
