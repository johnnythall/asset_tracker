class AssetsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @assets = policy_scope(Asset)
    #@assets = Asset.where("access_level <= ?", current_user[:role])
    respond_with(@assets)
    
  end

  def show
    respond_with(@asset)
  end

  def new
    
    @asset = Asset.new
    authorize @asset
    respond_with(@asset)
    
  end

  def edit
  end

  def create
    @asset = Asset.new(asset_params)
    @asset.save
    respond_with(@asset)
  end

  def update
    @asset.update(asset_params)
    authorize @asset
    respond_with(@asset)
  end

  def destroy
    @asset.destroy
    respond_with(@asset)
  end

  private
    def set_asset
      @asset = Asset.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:barcode, :name, :description, :category_id, :location, :value, :access_level, :available)
    end
end
