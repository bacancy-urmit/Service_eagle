# frozen_string_literal: true

class CreateServiceCenterCapacities < ActiveRecord::Migration[6.0]
  def change
    create_table :service_center_capacities do |t|
      t.integer :count
      t.datetime :date

      t.timestamps
    end
  end
end
