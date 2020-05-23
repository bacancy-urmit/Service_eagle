# frozen_string_literal: true

class AddColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :payment_confirmation, :string, default: 'pending'
  end
end
