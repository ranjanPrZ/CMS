class ReasoningsController < ApplicationController
  def index
    @reasonings = Reasoning.all
    respond_to do |format|
      format.html
      format.json { render json: @reasonings }
    end
  end

  def new
    @reasoning = Reasoning.new
  end

  def create
      reasoning = Reasoning.new(reasoning_params)
      if reasoning.save
        redirect_to reasonings_url
      else
        render :new
      end
    
  end


  private

  def reasoning_params
    params.require(:reasoning).permit(:question, :optional_answers, :answer, :type)
  end
end
