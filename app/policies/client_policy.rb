class ClientPolicy < ApplicationPolicy
  def index?
    access_for_client?
  end

  def show?
    access_for_client?
  end

  def create?
    access_for_client?
  end

  def update?
    access_for_client?
  end

  def destroy?
    access_for_client?
  end

  def search?
    client.id == current_user.id?
  end

  private

  def access_for_client?
    user.salon_owner? || user.professional?
  end

end
