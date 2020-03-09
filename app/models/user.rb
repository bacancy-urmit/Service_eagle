# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  has_one :user_servicecenter
  has_many :booked_appointments, dependent: :destroy
  has_many :servicecenters, through: :booked_appointments
  has_many :user_servicecenters, dependent: :destroy
  has_many :servicecenters, through: :user_servicecenters
  has_many :company_admins, dependent: :destroy
  has_many :companies, through: :company_admins
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :assign_default_role
  scope :service_center_admins, -> { User.joins(:roles).where('roles.name = ?', 'servicecenter_admin') }
  scope :company_admins, -> { User.joins(:roles).where('roles.name = ?', 'company_admin') }
  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
