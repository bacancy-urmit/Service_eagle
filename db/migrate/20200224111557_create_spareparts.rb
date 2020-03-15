# frozen_string_literal: true

class CreateSpareparts < ActiveRecord::Migration[6.0]
  def change
    create_table :spareparts do |t|
      t.string :model_name
      t.string :sparepart_name
      t.float :price
      t.integer :quantity
      t.datetime :model_year

      t.timestamps
    end
  end
end
