# frozen_string_literal: true

class AddServiceCenterToServiceCenterCapacity < ActiveRecord::Migration[6.0]
  def change
    add_reference :service_center_capacities, :service_center, foreign_key: true
  end
end
