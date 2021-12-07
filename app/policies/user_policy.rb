class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true if user.present? and user.role=='Admin'
  end
  def showdev?
    return true if user.role == "Developer"
  end
  
end
