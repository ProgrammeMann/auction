class RatesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  before_action :set_lot, only: [:create]

  expose_decorated :rate


  def index
    @rates = Rate.all    
  end

  def new
    @rate = Rate.new
  end


  def create
    @rate = @lot.rates.new(rate_params)
    @rate.user_id = current_user.id
    @rate.save
    redirect_to lot_path(@lot)

  end

  def destroy
    @rate.destroy
  end

  private
    def set_rate
      @rate = Rate.find(params[:id])
    end

    def set_lot
      @lot = Lot.find(params[:lot_id])
    end

    def rate_params
      params.require(:rate).permit(:lot_id, :user_id, :users_rate)
    end
end