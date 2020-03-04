class ChangeColumnToServiceCenterCapacity < ActiveRecord::Migration[6.0]
  def change
    change_column :service_center_capacities, :date, :date
  end
end
