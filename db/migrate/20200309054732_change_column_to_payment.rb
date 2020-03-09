# frozen_string_literal: true

class ChangeColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :is_payment_receieved, :is_payment_received
  end
end
