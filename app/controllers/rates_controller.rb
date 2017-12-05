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
    @max_rate = ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE (lot_id = #{@rate.lot_id})")
    if (@max_rate.getvalue(0,0) < @rate.value && @lot.start_price <= @rate.value)
      @rate.save
      flash[:notice] = "Your rate is accepted"
    else
      flash[:notice] = "Your rate very small, please enter rate more than #{@max_rate.getvalue(0,0)} and #{@lot.start_price}"
    end
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
      params.require(:rate).permit(:lot_id, :user_id, :value)
    end
end