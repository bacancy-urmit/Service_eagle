# frozen_string_literal: true

class ServiceUpdate < ApplicationRecord
  validates :service_status, presence: true
  validates :description, presence: true
  validates :estimation, presence: true
  belongs_to :booked_appointment
  def self.search(search)
    if search
      booked_appoinments = BookedAppointment.find_by(token: search)
      return booked_appoinments.service_updates if booked_appoinments
    end
    ServiceUpdate.all
  end

  def self.initiate_payment(appointment)
    appointment.build_payment.save if appointment.payment.nil? 
  end

  private

  def completed_service_status?
    service_status == 'completed'
  end
end
