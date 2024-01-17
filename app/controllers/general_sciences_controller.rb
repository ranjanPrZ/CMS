class GeneralSciencesController < ApplicationController
  def index
    @general_sciences = GeneralScience.all
    respond_to do |format|
      format.html
      format.json { render json: @general_sciences }
    end
  end

  def new
    @general_science = GeneralScience.new
  end

  def create
      general_science = GeneralScience.new(general_science_params)
      if general_science.save
        redirect_to general_sciences_url
      else
        render :new
      end
    
  end


  private

  def general_science_params
    params.require(:general_science).permit(:question, :optional_answers, :answer, :type)
  end
end
