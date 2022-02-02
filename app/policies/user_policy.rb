# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def destroy?
    able_to_manage?
  end

  def update?
    able_to_manage?
  end

  private

  def able_to_manage?
    user.admin || user.id == recosr.id
  end
end
