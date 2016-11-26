class ActivityPolicy < ApplicationPolicy
  
  def new?
  	user.admin?
  end

  def edit?
  	user.admin?
  end

  def destroy?
  	user.admin?
  end

end