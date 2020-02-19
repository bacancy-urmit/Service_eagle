class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :user, :firstname, :string
    add_column :user, :lastname, :string
    add_column :user, :username, :string
    add_column :user, :email, :string
    add_column :user, :contact, :string
    add_column :user, :password, :string
  end
end
