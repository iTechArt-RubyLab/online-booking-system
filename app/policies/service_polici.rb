# frozen_string_literal: true

class ServicePolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def destroy?
    able_to_manag_services?
  end

  def update?
    able_to_manag_services?
  end

  private

  def able_to_manag_services?
    service.user.admin || service.user.id == recosr.id
  end
end
