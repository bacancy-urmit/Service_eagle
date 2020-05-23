# frozen_string_literal: true

class ChangeColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    change_column :payments, :received_payment, :float
  end
end
