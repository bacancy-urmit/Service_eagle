# frozen_string_literal: true

# sparepart model
class Sparepart < ApplicationRecord
  has_one :used_sparepart, dependent: :destroy
  belongs_to :service_center
  validates :sparepart_name, presence: true
  validates :vehicle_name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 100_000, message: 'price should be greater than 0 and less than 1,00,000' }
  validates :quantity, presence: true, numericality: { greater_than: 0, message: 'quantity should must be greater than 0' }
  validates :manufactured_year, presence: true
end
