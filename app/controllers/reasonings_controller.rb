# frozen_string_literal: true

class ReasoningsController < ApplicationController
  before_action :current_reasoning, only: %i[edit show update]
  include SubjectTypeConstant

  def index
    @reasonings = Reasoning.page(params[:page].to_i).per(10)
    @urls = SUB_TYPE

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
      flash[:success] = 'New question added successfully'
      redirect_to reasonings_url
    else
      render :new
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  def edit; end

  def update
    if @reasoning.update(reasoning_params)
      flash[:success] = 'Updated successfully!!!'
      redirect_to reasonings_url
    else
      render :edit
    end
  rescue StandardError => e
    flash[:error] = "An error occurred: #{e.message}"
    redirect_to root_url
  end

  private

  def current_reasoning
    @reasoning = Reasoning.find(params['id'])
  end

  def reasoning_params
    params.require(:reasoning).permit(:question, :optional_answers, :answer, :type)
  end
end
