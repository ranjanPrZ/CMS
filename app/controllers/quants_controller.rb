# frozen_string_literal: true

class QuantsController < ApplicationController
  before_action :current_quant, only: %i[edit show update]
  include SubjectTypeConstant

  DEFAULT_PAGE = 1

  def index
    @quants = Quant.page(params[:page].to_i).per(8)
    @urls = SUB_TYPE

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
      flash[:success] = 'New question added successfully!'
      redirect_to quants_url
    else
      render :new
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  def update
    if @quant.update(quant_params)
      flash[:success] = 'Updated successfully!!!'
      redirect_to quants_url
    else
      render :edit
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  private

  def quant_params
    params.require(:quant).permit(:question, :optional_answers, :answer, :type)
  end

  def current_quant
    @quant = Quant.find(params['id'])
  end
end
