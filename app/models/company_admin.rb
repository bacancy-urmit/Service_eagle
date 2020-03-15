# frozen_string_literal: true

class CompanyAdmin < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :firstname, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :lastname, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+[\.]?[a-z]+[0-9]*\@[a-z]+.com/, message: 'Email should be unique or valid!' }
  validates :contact, presence: true, uniqueness: true, format: { with: /\+[0-9]{2}\-[0-9]{3}[\s]*[0-9]{3}[\s]*[0-9]{4}/, message: 'contact has already been taken or format is invalid' }
  validates :username, presence: true, format: { with: /\A(?=.{3,10}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])\z/, message: 'should not contain any two special character together or do not start with digit' }
  validates :password, presence: true, confirmation: true, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$\z/, message: 'Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character' }
  validates :password_confirmation, presence: true
  validates :company_id, presence: true
end
