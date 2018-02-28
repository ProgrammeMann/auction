class MyLotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot, only: %i[show edit update destroy]

  expose_decorated :lot

  expose :rate, -> { Rate.new }

  def index
    @lots = current_user.lots
  end

  private

  def set_lot
    @lot = Lot.find(params[:id])
  end

  def lot_params
    params.require(:lot).permit!
    end
end
