# frozen_string_literal: true

class RemoveColumnVehicleType < ActiveRecord::Migration[6.0]
  def change
    remove_column :booked_appointments, :vehicle_type
  end
end
