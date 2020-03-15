# frozen_string_literal: true

class ServiceUpdate < ApplicationRecord
  validates :service_status, presence: true
  validates :description, presence: true
  validates :estimation, presence: true
  belongs_to :booked_appointment
  def self.search(search)
    if search
      booked_appoinments = BookedAppointment.find_by(token: search)
      if booked_appoinments
        booked_appoinments.service_updates
      else
        ServiceUpdate.all
      end
    else
      ServiceUpdate.all
    end
  end
end
