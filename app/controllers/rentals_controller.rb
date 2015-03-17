class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rentals = policy_scope(Rental)
    respond_with(@rentals)
  end

  def show
    authorize @rental
    respond_with(@rental)
  end

  def new
    @rental = Rental.new
    respond_with(@rental)
  end

  def edit
  end

  def create
    @rental = Rental.new(rental_params)
    @rental[:rented_by_id] = current_user[:id]
    Asset.find(@rental[:asset_id_id]).rent()
    @rental.save
    respond_with(@rental)
  end
  
  def checkout
    @rental = Rental.new
    respond_with(@rental)
  end

  
  def rentcart
    cart = Cart.where("user_id_id = ?", current_user[:id])
    bulk_params = rental_params
    cart.each do |item|
      @rental = Rental.new(bulk_params)
      @rental[:rented_by_id] = current_user[:id]
      @rental[:asset_id_id] = item[:asset_id_id]
      if @rental.save
        Asset.find(@rental[:asset_id_id]).rent()
      end
    
    end
    Cart.empty()
    redirect_to :action => 'index'
  end
    

  def update
    @rental.update(rental_params)
    respond_with(@rental)
  end

  def destroy
    @rental.destroy
    respond_with(@rental)
  end

  private
    def set_rental
      @rental = Rental.find(params[:id])
    end

    def rental_params
      params.require(:rental).permit(:asset_id_id, :user_id_id, :rented_by_id, :start_date, :end_date)
    end
end
