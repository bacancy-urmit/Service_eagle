class AddBookedAppointmentToServceUpdate < ActiveRecord::Migration[6.0]
  def change
    add_reference :service_updates, :booked_appointment, foreign_key: true
  end
end
