# frozen_string_literal: true

class Invoice < ApplicationRecord
  belongs_to  :booked_appointment
end
