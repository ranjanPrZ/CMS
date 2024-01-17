class GeneralSciencesController < ApplicationController
  before_action :current_general_science, only: [:edit, :show, :update]

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

  def update
    if @general_science.update(quant_params)
      redirect_to general_sciences_url
    else
      render :edit
    end
  end

  private

  def general_science_params
    params.require(:general_science).permit(:question, :optional_answers, :answer, :type)
  end

  def current_general_science
    @general_science = GeneralScience.find(params['id'])
  end
end
