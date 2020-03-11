# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  validates :lastname, presence: true, if: :firstname_precent?
  validates :firstname, presence: true, messgae: 'First latter should must be presence'
  validates :lastname, presence: true, messgae: 'First latter should must be presence'
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+[\.]?[a-z]+[0-9]*\@[a-z]+.com/, message: 'Email should be unique or valid!' }
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
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
