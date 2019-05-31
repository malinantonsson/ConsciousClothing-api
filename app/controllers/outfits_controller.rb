class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :update, :destroy]

  # GET /outfits
  def index
    @outfits = Outfit.all
    json_response(@outfits)
  end

  # POST /outfits
  def create
    @outfit = Outfit.create!(outfit_params)
    json_response(@outfit, :created)
  end

  # GET /outfits/:id
  def show
    render json: { outfit: @outfit, items: @outfit.items }, status: :ok
    # json_response(@outfit)
  end

  # PUT /outfits/:id
  def update
    @outfit.update(outfit_params)
    head :no_content
  end

  # DELETE /outfits/:id
  def destroy
    @outfit.destroy
    head :no_content
  end

  private

  def outfit_params
    # whitelist params
    params.permit(:title, :created_by, :items, :description, :worn)
  end

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end
end
