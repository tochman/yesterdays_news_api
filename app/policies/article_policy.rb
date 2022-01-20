class ArticlePolicy < ApplicationPolicy
  
  def create?
    @user.is_staff?
  end
end
