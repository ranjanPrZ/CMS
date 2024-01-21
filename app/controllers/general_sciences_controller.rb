class GeneralSciencesController < ApplicationController
  before_action :current_general_science, only: [:edit, :show, :update]

  def index
    @general_sciences = GeneralScience.page(params[:page].to_i).per(10)
    Rails.logger.info ">>>>>>>>>>>>>>> #{@general_sciences.inspect}"

    respond_to do |format|
      format.html
      format.json { render json: @general_sciences }
    end
  end

  def new
    @general_science = GeneralScience.new
  end

  def create
    begin
      general_science = GeneralScience.new(general_science_params)
      if general_science.save
        flash[:success] = "Added successfully!!!"
        redirect_to general_sciences_url
      else
        render :new
      end
    rescue => e
      flash[:error] = "An error occurred: #{e.message}"
      redirect_to root_url
    end
  end

  def update
    begin
      if @general_science.update(quant_params)
        flash[:success] = "Updated successfully!!!"
        redirect_to general_sciences_url
      else
        render :edit
      end
    rescue => e
      flash[:error] = "An error occurred: #{e.message}"
      redirect_to root_url
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
