# frozen_string_literal: true

class AddTypeToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :type, :string
  end
end
