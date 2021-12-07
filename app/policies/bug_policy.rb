class BugPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

def index?
  
    return true if (user.present? && (user.role=='Admin'||user.role=='QA'||(user.role=='Developer'&& bug.status == (user.first_name+ " "+user.last_name))))

    end

end
