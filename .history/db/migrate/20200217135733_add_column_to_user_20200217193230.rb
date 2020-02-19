class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :contact, :string
    add_column :users, :password, :string
  end
end
