# frozen_string_literal: true

class CreateDataImports < ActiveRecord::Migration[7.0]
  def change
    create_table :data_imports, &:timestamps
  end
end
