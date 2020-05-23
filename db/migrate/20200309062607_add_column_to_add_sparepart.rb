# frozen_string_literal: true

class AddColumnToAddSparepart < ActiveRecord::Migration[6.0]
  def change
    add_column :used_spareparts, :quantity, :integer
    add_column :used_spareparts, :total, :float
  end
end
