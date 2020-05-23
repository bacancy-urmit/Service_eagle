# frozen_string_literal: true

class CreateUserServicecenters < ActiveRecord::Migration[6.0]
  def change
    create_table :user_servicecenters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :service_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
