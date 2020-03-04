# frozen_string_literal: true

# middle table that associates user with service center
class UserServicecenter < ApplicationRecord
  belongs_to :user
  belongs_to :service_center
end
