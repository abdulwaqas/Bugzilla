class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  attr_reader :user, :bug

  def initialize(user, bug)
    @user = user
    @bug = bug
  end
def index?
  
    return true if user.present? 
      end


  def show?
  
  return true if user.present?
  end
  def create?
    return true if user.present? and (user.role=='Admin'||user.role=='Admin')
  end
  def update?
    return true if user.present? 
  end

    
  def destroy?
    return true if user.present? and user.role=='Admin'
  end

end
