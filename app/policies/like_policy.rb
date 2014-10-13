class LikePolicy < ApplicationPolicy
  def create?
    user.present? && record.user == current_user
  end

  def destroy?
    user.present? && record.user == current_user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
