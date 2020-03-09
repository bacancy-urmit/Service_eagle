# frozen_string_literal: true

class Payment < ApplicationRecord
  after_initialize :add_default_value

  private

  def add_default_value
    self.service_charge = 0.0
    self.is_payment_received = false
    self.total = 0.0
  end
end
