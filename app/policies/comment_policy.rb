class CommentPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def destroy?
    user.present? && (user.admin? || user.moderator? || record.user == user)
  end

end
