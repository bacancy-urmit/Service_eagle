# frozen_string_literal: true

class AddSparepartToUsedSparepart < ActiveRecord::Migration[6.0]
  def change
    add_reference :used_spareparts, :sparepart, foreign_key: true
  end
end
