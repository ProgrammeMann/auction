class RatesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_rate, only: %i[show edit update destroy]
  expose_decorated :rate
  expose_decorated :lot

  def index
    @rates = Rate.all
  end

  def new
  end

  def create
    rate.user = current_user
    flash[:notice] = "Your rate is accepted" if rate.save

    redirect_to lot
  end

  def destroy
    @rate.destroy
  end

  private

  def rate_params
    params.require(:rate).permit(:lot_id, :user_id, :value)
  end
end
