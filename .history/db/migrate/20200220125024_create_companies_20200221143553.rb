class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :email
      t.references :company_admin
      t.timestamps
    end
  end
end
