# frozen_string_literal: true

class Sparepart < ApplicationRecord
  has_one :used_sparepart
end
