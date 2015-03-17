class RentalPolicy < ApplicationPolicy
  attr_reader :current_user, :model

    def initialize(current_user, model)
      @current_user = current_user
      @rental = model
    end

    def index?
#      @current_user.admin?
    end

    def show?
      @current_user.admin? or @rental[:user_id_id] == @current_user[:id]
    end

    def update?
      @current_user.admin?
    end

    def destroy?
      return false if @current_user == @user
      @current_user.admin?
    end
    
    def new?
      @current_user.admin? or @current_user.ta?
    end

  
  class Scope < Scope
    def resolve
          if user.admin? or user.ta?
            scope.all
          else
            scope.where("user_id_id == ?", user[:id])
          end
        end
      end
end
