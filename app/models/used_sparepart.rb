# frozen_string_literal: true

class UsedSparepart < ApplicationRecord
  belongs_to :sparepart
  belongs_to :booked_appointment
  before_save :calculate_sparepart_total
  validates :quantity, presence: true, numericality: { greater_than: 0, message: 'should be greater than 0' }

  def self.search(search)
    if search
      booked_appoinments = BookedAppointment.find_by(token: search)
      if booked_appoinments
        booked_appoinments.used_spareparts
      else
        UsedSparepart.all
      end
    else
      UsedSparepart.all
    end
  end

  private

  def calculate_sparepart_total
    sparepart = Sparepart.find(sparepart_id)
    self.total = quantity * sparepart.price
  end
end
