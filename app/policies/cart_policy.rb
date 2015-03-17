class CartPolicy < ApplicationPolicy
  attr_reader :current_user, :model

    def initialize(current_user, model)
      @current_user = current_user
      @cart = model
    end

    def index?
      @current_user.admin? or @current_user.ta?
    end

    def show?
      @current_user.admin? or @current_user.ta?
    end

    def update?
      @current_user.admin? or @current_user.ta?
    end

    def destroy?
      @current_user.admin? or @current_user.ta?
    end
    
    def new?
      @current_user.admin? or @current_user.ta?
    end
  end