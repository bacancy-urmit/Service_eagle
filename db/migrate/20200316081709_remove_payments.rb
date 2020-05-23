# frozen_string_literal: true

class RemovePayments < ActiveRecord::Migration[6.0]
  def change
    drop_table :payments
  end
end
