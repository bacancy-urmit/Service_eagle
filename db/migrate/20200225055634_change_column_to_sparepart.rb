# frozen_string_literal: true

# this migration is for changing the name of columns in spareparts table
class ChangeColumnToSparepart < ActiveRecord::Migration[6.0]
  def change
    rename_column :spareparts, :model_name, :vehicle_name
    rename_column :spareparts, :model_year, :manufactured_year
  end
end
