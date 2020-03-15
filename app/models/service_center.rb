# frozen_string_literal: true

class ServiceCenter < ApplicationRecord
  has_many :user_servicecenters, dependent: :destroy
  has_many :users, through: :user_servicecenters, dependent: :destroy
  has_many :bookded_appointments, dependent: :destroy
  has_many :users, through: :bookded_appointments, dependent: :destroy
  validates :name, presence: true, uniqueness: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :area, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :city, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :state, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :pincode, presence: true, format: { with: /[0-9]/, message: 'characters are not allowed ' }
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+[\.]?[a-z]+[0-9]*\@[a-z]+.com/, message: 'Email should be unique or valid!' }
end
