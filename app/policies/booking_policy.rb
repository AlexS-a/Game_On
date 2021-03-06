class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
     return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def status_accept?
    true
  end

  def status_decline?
    true
  end
end
