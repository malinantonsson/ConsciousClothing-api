class OutfitsController < ApplicationController
  before_action :set_outfit, only: [:show, :update, :destroy]

  # GET /outfits
  def index
    @outfits = Outfit.all
    json_response(@outfits)
  end

  # POST /outfits
  def create
    @outfit = Outfit.create!(todo_params)
    json_response(@outfit, :created)
  end

  # GET /outfits/:id
  def show
    json_response(@outfit)
  end

  # PUT /outfits/:id
  def update
    @outfit.update(todo_params)
    head :no_content
  end

  # DELETE /outfits/:id
  def destroy
    @outfit.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end
end
