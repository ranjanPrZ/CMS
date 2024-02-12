class CreateDataImports < ActiveRecord::Migration[7.0]
  def change
    create_table :data_imports do |t|

      t.timestamps
    end
  end
end
