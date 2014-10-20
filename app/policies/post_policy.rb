class PostPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def destroy?
    user.present? && (user.admin? || user.moderator? || record.user == user)
  end
end
