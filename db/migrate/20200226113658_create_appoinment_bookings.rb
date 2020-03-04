# frozen_string_literal: true

class CreateAppoinmentBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :appoinment_bookings do |t|
      t.string :vehicle_name
      t.string :service
      t.datetime :service_date
      t.datetime :pickup_date
      t.string :special_request
      t.string :employee_name
      t.datetime :drop_time
      t.datetime :pickup_time
      t.string :service_status, default: 'pending'
      t.references :user, null: false, foreign_key: true
      t.references :service_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
