class FinishLotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  expose_decorated :lot
	
  expose :rate, -> { Rate.new }

def index
	@lots = Lot.where("end_datetime <= ?", DateTime.now)
end


	private
	def set_lot
	  @lot = Lot.find(params[:id])
	end

	def lot_params
      params.require(:lot).permit!
    end
end