class GroupPolicy < ApplicationPolicy
  class Scope < Scope
  	def resolve
  		scope.where(user: user)
  	end
  end

  def index?
    user.admin?
  end  

  def destroy?
   
  end

  def edit?
  	
  end
end 