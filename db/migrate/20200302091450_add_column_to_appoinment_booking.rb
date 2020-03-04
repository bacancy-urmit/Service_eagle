class AddColumnToAppoinmentBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :appoinment_bookings, :vehicle_type, :string
  end
end
