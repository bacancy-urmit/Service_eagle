# frozen_string_literal: true

class Company < ApplicationRecord
  has_and_belongs_to_many :company_admin
end
