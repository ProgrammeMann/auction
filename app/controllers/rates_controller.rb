class RatesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_rate, only: [:show, :edit, :update, :destroy]
  before_action :set_lot, only: [:create]

  expose_decorated :rate


  def index
    @rates = Rate.all    
  end

  def new
  end


  def create
    rate.user = current_user
    if rate.save
      flash[:notice] = "Your rate is accepted" 
    end
    render template: "lots/show"
  end

  def destroy
    @rate.destroy
  end

  private
    def set_lot
      @lot = Lot.find(params[:lot_id])
    end

    def rate_params
      params.require(:rate).permit(:lot_id, :user_id, :value)
    end
end