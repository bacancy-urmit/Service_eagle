class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :User, :firstname, :string
  end
end
