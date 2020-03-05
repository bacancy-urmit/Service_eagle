class CreateServiceUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :service_updates do |t|

      t.timestamps
    end
  end
end
