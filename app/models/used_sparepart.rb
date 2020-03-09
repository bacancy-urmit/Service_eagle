# frozen_string_literal: true

class UsedSparepart < ApplicationRecord
  belongs_to :sparepart
  belongs_to :booked_appointment
  def self.search(search)
    if search
      booked_appoinments = BookedAppointment.find_by(token: search)
      binding.pry
      if booked_appoinments
        booked_appoinments.used_spareparts
      else
        UsedSparepart.all
      end
    else
      UsedSparepart.all
    end
  end
end
