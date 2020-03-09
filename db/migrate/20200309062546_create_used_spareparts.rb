class CreateUsedSpareparts < ActiveRecord::Migration[6.0]
  def change
    create_table :used_spareparts do |t|

      t.timestamps
    end
  end
end
