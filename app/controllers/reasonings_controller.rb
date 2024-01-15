class ReasoningsController < ApplicationController
  def index
    @reasonings = Reasoning.all
  end

  def new
    @reasoning = Reasoning.new
  end

  def create
      quant = Reasoning.new(quant_params)
      if quant.save
        redirect_to reasonings_url
      else
        render :new
      end
    
  end


  private

  def quant_params
    params.require(:reasoning).permit(:question, :optional_answers, :answer)
  end
end
