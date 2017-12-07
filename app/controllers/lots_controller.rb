class LotsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_lot, only: [:show, :edit, :update, :destroy]
  # before_action :check_ended_lot


  expose_decorated :lot
  expose :rate, -> { Rate.new }



  # GET /lots
  # GET /lots.json
  def index
    @lots = Lot.all
  end

  # GET /lots/1
  # GET /lots/1.json
  def show
    @result = ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE (lot_id = #{@lot.id})")
    @result_user = ActiveRecord::Base.connection.execute("SELECT max(rates.value) FROM rates WHERE (lot_id = #{@lot.id} AND user_id = #{current_user.id})")
  end

  # GET /lots/new
  def new
    @lot = Lot.new
  end

  # GET /lots/1/edit
  def edit
    if current_user.id != @lot.user_id
      render 'show'     
    end
  end

  # POST /lots
  # POST /lots.json
  def create
    @lot = current_user.lots.new(lot_params)
      if @lot.save
        CheckEndTimeWorker.perform_at(@lot.end_datetime, @lot.id)
        redirect_to @lot, notice: 'Lot was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /lots/1
  # PATCH/PUT /lots/1.json
  def update
      if @lot.update(lot_params)
        redirect_to @lot, notice: 'Lot was successfully updated.'   
      else
        render :edit
      end
  end

  # DELETE /lots/1
  # DELETE /lots/1.json
  def destroy
    if @lot.user_id == current_user.id
      @lot.destroy
      redirect_to lots_url, notice: 'Lot was successfully destroyed.' 
    else
      redirect_to lots_url, notice: 'Haha, its not your lot.' 
    end
  end


  # def check_ended_lot
  #   if condition
      
  #   else
      
  #   end
    
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lot
      @lot = Lot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lot_params
      params.require(:lot).permit!
    end
end
