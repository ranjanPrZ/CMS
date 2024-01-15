class GeneralSciencesController < ApplicationController
  def index
    @general_sciences = GeneralScience.all
  end

  def new
    @general_science = GeneralScience.new
  end

  def create
      quant = GeneralScience.new(quant_params)
      if quant.save
        redirect_to general_sciences_url
      else
        render :new
      end
    
  end


  private

  def quant_params
    params.require(:general_science).permit(:question, :optional_answers, :answer)
  end
end
