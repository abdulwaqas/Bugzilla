class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.role=='Admin'
        scope.all
      elsif(user.role=='QA')
        
        scope.where.not(status: 'Done' )
      elsif(user.role=="Developer")
        scope.where(status: (user.first_name+ " "+user.last_name))

      end
    end
  end

def index?
  
    return true if user.present? 
      end


  def show?
  
  return true if user.present?
  end
  def create?
    return true if user.present? and (user.role=='Admin'||user.role=='QA')
  end
  def update?
    if user.present? 
      return true
    else
      
    end
  end

    
  def destroy?
    return true if user.present? and user.role=='Admin'
  end







  

  def new?
    create?
  end


  def edit?
    update?
  end

end
