class ReasoningsController < ApplicationController
  before_action :current_reasoning, only: [:edit, :show, :update]

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


  def edit; end

  def update
    if @reasoning.update(reasoning_params)
      redirect_to reasonings_url
    else
      render :edit
    end
  end

  private

  def current_reasoning
    @reasoning = Reasoning.find(params['id'])
  end

  def reasoning_params
    params.require(:reasoning).permit(:question, :optional_answers, :answer, :type)
  end
end
