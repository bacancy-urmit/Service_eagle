class AddColumnToAppoinmentBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :appoinment_bookings, :vehicle_type, :string
    add_column :appoinment_bookings, :token, :string
  end
end
