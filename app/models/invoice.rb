# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to  :booked_appointment
  belongs_to :used_sparepart
  byebug
  after_initialise :set_service_charge, if: :params[:service] == 'paid'

  private

  def set_service_charge
    self.service_charge = 350
  end
end
