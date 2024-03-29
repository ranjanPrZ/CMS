# frozen_string_literal: true

class GeneralSciencesController < ApplicationController
  before_action :current_general_science, only: %i[edit show update]
  include SubjectTypeConstant

  def index
    @general_sciences = GeneralScience.page(params[:page].to_i).per(10)
    @urls = SUB_TYPE

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
      flash[:success] = 'Added successfully!!!'
      redirect_to general_sciences_url
    else
      render :new
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  def update
    if @general_science.update(quant_params)
      flash[:success] = 'Updated successfully!!!'
      redirect_to general_sciences_url
    else
      render :edit
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  private

  def general_science_params
    params.require(:general_science).permit(:question, :optional_answers, :answer, :type)
  end

  def current_general_science
    @general_science = GeneralScience.find(params['id'])
  end
end
