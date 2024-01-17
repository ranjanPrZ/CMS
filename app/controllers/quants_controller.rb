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
    begin
      quant = Quant.new(quant_params)
      if quant.save
        redirect_to quants_url
      else
        render :new
      end
    rescue => e
      flash[:error] = "An error occurred: #{e.message}"
      redirect_to root_url
    end
  end


  private

  def quant_params
    params.require(:quant).permit(:question, :optional_answers, :answer, :type)
  end
end
