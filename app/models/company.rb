# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :users , dependent: :destroy
  has_many :users, through: :company_admin, dependent: :destroy
end
