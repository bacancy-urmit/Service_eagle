class ServiceCenter < ApplicationRecord
  has_many :user_servicecenters, dependent: :destroy
  has_many :users, through: :user_servicecenters, dependent: :destroy
  has_many :appoinment_bookings, dependent: :destroy
  has_many :users, through: :appoinment_bookings, dependent: :destroy
end
