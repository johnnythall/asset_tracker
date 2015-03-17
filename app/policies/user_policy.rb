class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  
  def index?
    @current_user.admin?
  end
end
