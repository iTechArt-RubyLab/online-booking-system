# frozen_string_literal: true

class SalonPolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def destroy?; end

  def update?; end
end
