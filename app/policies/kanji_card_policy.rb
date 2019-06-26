class KanjiCardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    record_belongs_to_user?
  end

  def update?
    record_belongs_to_user?
  end

  def create?
    !user.nil?
  end

  def destroy?
    record_belongs_to_user?
  end

  private

  def record_belongs_to_user?
    record.user == user
  end

end
