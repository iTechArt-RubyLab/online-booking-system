# frozen_string_literal: true

class VisitPolicy < ApplicationPolicy
  def create?
    able_to_manag_visits?
  end

  def show?
    able_to_manag_visits?
  end

  def index?
    visit.user.admin
  end

  def destroy?
    able_to_manag_visits?
  end

  def update?
    able_to_manag_visits?
  end

  private

  def able_to_manag_visits?
    visit.user.admin || visit.user == recosr.user || visit.client == recosr.client
  end
end
