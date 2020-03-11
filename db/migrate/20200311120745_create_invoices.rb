class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.float :service_charge
      t.float :total

      t.timestamps
    end
  end
end
