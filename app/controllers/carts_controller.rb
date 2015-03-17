class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    authorize Cart
    @cart = Cart.new
    @carts = Cart.all
    respond_with(@carts)
  end

  def show
    authorize Cart
    respond_with(@cart)
  end

  def new
    authorize Cart
    @cart = Cart.new
    respond_with(@cart)
  end

  def edit
  end

  def create
    @cart = Cart.new(cart_params)
    @cart[:user_id_id] = current_user[:id]
    @cart[:asset_id_id] = Asset.barcode_scan(@cart[:asset_id_id])
    @cart.save
    #respond_with(@cart)
    redirect_to :action => 'index'
  end

  def update
    authorize Cart
    @cart.update(cart_params)
    respond_with(@cart)
  end

  def destroy
    authorize Cart
    @cart.destroy
    respond_with(@cart)
  end

  private
    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:user_id_id, :asset_id_id)
    end
end
