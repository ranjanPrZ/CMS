# frozen_string_literal: true

class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :question
      t.string :optional_answers
      t.string :answer

      t.timestamps
    end
  end
end
