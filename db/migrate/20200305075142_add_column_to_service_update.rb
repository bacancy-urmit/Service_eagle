# frozen_string_literal: true

class AddColumnToServiceUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :service_updates, :service_status, :string
    add_column :service_updates, :description, :string
    add_column :service_updates, :estimation, :number
  end
end
