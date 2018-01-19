class LotsController < ApplicationController

  before_action :authenticate_user!
  # before_action :check_ended_lot


  expose_decorated :lot

  expose :rate, -> { Rate.new }



  def index
    @lots = Lot.all
  end

  def show
    @result = ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE lot_id = '#{lot.id}'")
    @result_user = ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE (lot_id = '#{lot.id}' AND user_id = '#{current_user.id}')")
  end

  def new
  end

  def edit
    unless current_user == lot.user_id
      render 'edit'     
    end
  end

  def create
    lot.user = current_user

      if lot.save
        CheckEndTimeWorker.perform_at(lot.end_datetime, lot.id)
        redirect_to lot, notice: 'Lot was successfully created.'
      else
        render :new
      end
  end

  def update
      if lot.update(lot_params)
        redirect_to lot, notice: 'Lot was successfully updated.'   
      else
        render :edit
      end
  end

  def destroy
    if lot.user == current_user
      lot.destroy
      redirect_to lots_url, notice: 'Lot was successfully destroyed.' 
    else
      redirect_to lots_url, notice: 'Haha, its not your lot.' 
    end
  end

  private

    def lot_params
      params.require(:lot).permit!
    end
end
