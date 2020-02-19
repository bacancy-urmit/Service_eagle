class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :User, :firstname, :string
    add_column :User, :lastname, :string
    add_column :User, :username, :string
    add_column :User, :email, :string
    add_column :User, :contact, :string
    add_column :User, :password, :string
  end
end
