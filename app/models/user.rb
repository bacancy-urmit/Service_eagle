# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+[\.]?[a-z]+[0-9]*\@[a-z]+.com/, message: 'Email should be unique or valid!' }
  validates :contact, presence: true, uniqueness: true, format: { with: /\+[0-9]{2}\-[0-9]{3}[\s]*[0-9]{3}[\s]*[0-9]{4}/, message: 'contact has already been taken or format is invalid' }
  validates :username, presence: true, format: { with: /\A(?=.{3,10}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/, message: 'should not contain any two special character together or do not start with digit' }
  validates :password, presence: true, confirmation: true, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$\z/, message: 'Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character' }
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
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  after_create :assign_default_role
  scope :service_center_admins, -> { User.joins(:roles).where('roles.name = ?', 'servicecenter_admin') }
  scope :company_admins, -> { User.joins(:roles).where('roles.name = ?', 'company_admin') }
  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      end
  end

  def self.set_service_count
    user = User.service_center_admins
    user.each do |item|
      ServiceEagleMailer.set_service_count(item).deliver
    end
  end
end
