class CategoryPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @category = model
  end
    
  def index?
  end
  
  def show?
  end
  
  def update?
    @current_user.admin?
  end
  
  def destroy?
    @current_user.admin?
  end
end
