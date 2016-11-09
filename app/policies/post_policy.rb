class PostPolicy < ApplicationPolicy
  class Scope < Scope
  	def resolve
  		scope.where(user: user)
  	end
  end

  def destroy?
    record.user == user
  end

  def edit?
  	record.user == user
  end
end 