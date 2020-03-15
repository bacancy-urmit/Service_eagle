# frozen_string_literal: true

class BookedAppointment < ApplicationRecord
  validates :vehicle_name, presence: true, format: { with: /'\D'/, message: 'digit is not allowed' }
  validates :service, presence: true
  validates :service_date, presence: true
  validates :pickup_date, presence: true
  validates :special_request, presence: true
  validates :drop_time, presence: true
  validates :pickup_time, presence: true
  validates :service_status, presence: true
  validates :user_id, presence: true
  validates :service_center_id, presence: true
  validate :is_token_present
  before_create :set_token
  after_create :check_availability
  after_create :send_confirmation
  belongs_to :user
  belongs_to :service_center
  has_many :used_spareparts
  has_many :spareparts, through: :used_spareparts
  has_many :service_updates, dependent: :destroy
  has_many :invoices
  Two_wheeler = %w[bike activa Other].freeze
  Four_wheeler = %w[truck car Other].freeze
  def is_token_present
    if token.nil?
    end
  rescue Exception => e
    set_token
  end

  def send_confirmation
    ServiceEagleMailer.send_confirmation(token).deliver
  end

  def self.search(search)
    if search
      booked_appoinment = BookedAppointment.find_by(token: search)
      booked_appoinment || BookedAppointment.all
    else
      BookedAppointment.all
    end
  end

  private

  def set_token
    self.token = SecureRandom.alphanumeric(10)
  end

  def check_availability
    capacity = ServiceCenterCapacity.find_by(service_center_id: service_center_id,
                                             date: service_date)

    appointment_count = BookedAppointment.where(service_date: service_date)
    destroy if capacity.count <= appointment_count.count
  end
end
