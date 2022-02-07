class ClientPolicy < ApplicationPolicy
  def index?
    access_for_current_user?
  end

  def show?
    access_for_client?
  end

  def create?
    access_for_client?
    # all may create /true
  end

  def update?
    access_for_client?
  end

  def destroy?
    access_for_client?
  end

  def search?
    #clien.id == current_user.id?
  end

  private

  def access_for_client?
    user.salon_owner? || user.professional?
  end

  def access_for_current_user?
    client.id = current_user.id
  end
end
