class QuantsController < ApplicationController
  def index
    @quants = Quant.all
    respond_to do |format|
      format.html
      format.json { render json: @quants }
    end
  end

  def new
    @quant = Quant.new
  end

  def create
      quant = Quant.new(quant_params)
      if quant.save
        redirect_to quants_url
      else
        render :new
      end
    
  end


  private

  def quant_params
    params.require(:quant).permit(:question, :optional_answers, :answer)
  end
end
