# frozen_string_literal: true

class ChangeColumnToInvoice < ActiveRecord::Migration[6.0]
  def change
    change_column :invoices, :service_charge, :integer, default: 0
    change_column :invoices, :total, :float, default: 0.0
  end
end
