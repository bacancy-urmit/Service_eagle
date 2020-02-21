class CreateServiceCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :service_centers do |t|
      t.string :name
      t.string :area
      t.string :city
      t.string :state
      t.string :pincode
      t.string :email

      t.timestamps
    end
  end
end
