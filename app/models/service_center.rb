# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  has_many :user_servicecenters, dependent: :destroy
  has_many :users, through: :user_servicecenters, dependent: :destroy
  has_many :bookded_appointments, dependent: :destroy
  has_many :users, through: :bookded_appointments, dependent: :destroy
end
