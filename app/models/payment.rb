# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :booked_appointment
  before_save :change_confirmation_status, if: :payment_received?

  def payment_received?
    false if received_payment.nil?
  end

  private

  def change_confirmation_status
    self.payment_confirmation = 'received'
  end
end
