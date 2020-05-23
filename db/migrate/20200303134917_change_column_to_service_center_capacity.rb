# frozen_string_literal: true

class ChangeColumnToServiceCenterCapacity < ActiveRecord::Migration[6.0]
  def up
    change_column :service_center_capacities, :date, :date
  end

  def down
    change_column :service_center_capacities, :date, :datetime
  end
end
