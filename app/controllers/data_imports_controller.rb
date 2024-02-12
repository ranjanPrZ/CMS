# frozen_string_literal: true

class DataImportsController < ApplicationController
  def new
    @data_import = DataImport.new
  end

  def create
    @data_import = DataImport.new(data_import_params)

    if @data_import.save
      flash[:success] = 'Data imported successfully!'
      redirect_to root_path
    else
      flash.now[:error] = 'Error importing data.'
      render :new
    end
  end

  private

  def data_import_params
    params.require(:data_import).permit(:xlsx_file)
  end
end
