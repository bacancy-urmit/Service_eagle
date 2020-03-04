class AddServiceCenterToCompany < ActiveRecord::Migration[6.0]
  def change
    add_reference :companies, :service_center, foreign_key: true
  end
end
