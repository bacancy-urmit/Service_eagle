class AddBookedAppointmentToInvoice < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :booked_appointment, foreign_key: true
  end
end
