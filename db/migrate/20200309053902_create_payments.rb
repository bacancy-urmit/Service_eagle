class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.boolean :is_payment_receieved
      t.decimal :service_charge
      t.decimal :total

      t.timestamps
    end
  end
end
