# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :company_admins, dependent: :destroy
  has_many :users, through: :company_admins, dependent: :destroy
  validates :name, presence: true, format: { with: /[a-zA-Z]{4,10}/, message: 'special characters and digits are not allowed' }
  validates :website, presence: true, uniqueness: true, format: { with: %r{(http://www\.|https://www\.|http://|https://)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(/.*)?}, message: 'format is invalid' }
  validates :email, presence: true, uniqueness: true, format: { with: /[a-z]+[\.]?[a-z]+[0-9]*\@[a-z]+.com/, message: 'Email should be unique or valid!' }
end
