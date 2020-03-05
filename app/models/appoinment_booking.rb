# frozen_string_literal: true

class AppoinmentBooking < ApplicationRecord
  before_create :set_token
  belongs_to :user
  belongs_to :service_center
  has_many :service_updates
  Two_wheeler = %w[bike activa Other].freeze
  Four_wheeler = %w[truck car Other].freeze

  private

  def set_token
    self.token = SecureRandom.alphanumeric(10)
  end
end
