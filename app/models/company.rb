# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :company_admins , dependent: :destroy
  has_many :users, through: :company_admins, dependent: :destroy
end
