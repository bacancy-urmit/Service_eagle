# frozen_string_literal: true

class CreateCompanyAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :company_admins do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
