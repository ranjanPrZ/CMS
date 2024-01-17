class QuantsController < ApplicationController
  before_action :current_quant, only: [:edit, :show, :update]

  def index
    @quants = Quant.all
    respond_to do |format|
      format.html
      format.json { render json: @quants }
    end
  end

  def new
    @quant = Quant.new
  end

  def create
    begin
      quant = Quant.new(quant_params)
      if quant.save
        flash[:success] = "New question added successfully!"
        redirect_to quants_url
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
      if @quant.update(quant_params)
        flash[:success] = "Updated successfully!!!"
        redirect_to quants_url
      else
        render :edit
      end
    rescue => e
      flash[:error] = "An error occurred: #{e.message}"
      redirect_to root_url
    end
  end


  private

  def quant_params
    params.require(:quant).permit(:question, :optional_answers, :answer, :type)
  end

  def current_quant
    @quant = Quant.find(params['id'])
  end
end
